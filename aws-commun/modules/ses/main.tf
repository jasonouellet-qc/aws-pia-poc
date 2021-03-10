#Référence: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from

resource "aws_ses_domain_identity" "main" {
  domain = var.domaines
}

resource "aws_ses_domain_dkim" "principal" {
  domain = aws_ses_domain_identity.main.domain
}

resource "aws_ses_domain_mail_from" "main" {
  domain           = aws_ses_domain_identity.main.domain
  mail_from_domain = "bounce.${aws_ses_domain_identity.main.domain}"
}

# Dans Identifiers, identifier à quel compte on veut partager l'utilisation de la ressource
data "aws_iam_policy_document" "SESPolicyDomainNotificationFullAccess" {
  statement {
    actions   = ["SES:SendRawEmail"]
    resources = [aws_ses_domain_identity.main.arn]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}

resource "aws_ses_identity_policy" "SESFullAccessNotificationDomain" {
  identity = aws_ses_domain_identity.main.arn
  name     = "SESFullAccessNotificationDomain"
  policy   = data.aws_iam_policy_document.SESPolicyDomainNotificationFullAccess.json
}

# Permet de contrôler indépendamement les courriels sans impact de changement
resource "aws_ses_email_identity" "main" {
  for_each = var.courriels_sortant

  email = each.value.courriel
}

/* Interaction avec Route53 pour la vérification des domaines automatisé */
data "aws_route53_zone" "selected" {
  name = var.domaines
}

# Route53 MX record
resource "aws_route53_record" "ses_domain_mail_from_mx" {
  zone_id = data.aws_route53_zone.selected.id
  name    = aws_ses_domain_mail_from.main.mail_from_domain
  type    = "MX"
  ttl     = "600"
  records = ["10 feedback-smtp.ca-central-1.amazonses.com"]
}

# Route53 TXT record for SPF

resource "aws_route53_record" "ses_domain_mail_from_txt" {
  zone_id = data.aws_route53_zone.selected.id
  name    = aws_ses_domain_mail_from.main.mail_from_domain
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.main.verification_token]
}

resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = data.aws_route53_zone.selected.id
  name    = "_amazonses.${data.aws_route53_zone.selected.name}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.main.verification_token]
}

resource "aws_route53_record" "amazonses_dkim_record" {
  count   = 3
  zone_id = data.aws_route53_zone.selected.id
  name    = "${element(aws_ses_domain_dkim.principal.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.principal.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

resource "aws_ses_domain_identity_verification" "verification" {
  domain = aws_ses_domain_identity.main.id

  depends_on = [aws_route53_record.ses_domain_mail_from_txt]
}
