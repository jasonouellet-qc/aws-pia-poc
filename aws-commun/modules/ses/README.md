# SES

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) |
| [aws_ses_domain_dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) |
| [aws_ses_domain_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) |
| [aws_ses_domain_identity_verification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity_verification) |
| [aws_ses_domain_mail_from](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from) |
| [aws_ses_email_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_email_identity) |
| [aws_ses_identity_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_identity_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| courriels\_sortant | n/a | `map(any)` | n/a | yes |
| domaines | Domaine a valider | `string` | `"notification.gouv.qc.ca"` | no |
| projet | Code de projet | `string` | n/a | yes |
| tags | Tags à appliquer sur toutes les ressources | `any` | n/a | yes |

## Outputs

No output.
