#==== Bucket de IaC ====
resource "aws_s3_bucket" "iac_bucket" {
  bucket = var.iac_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = var.log_bucket_name
    target_prefix = "log/s3/iac_bucket/"
  }

  tags = merge(var.tags,
    map("Name", var.iac_bucket_name)
  )
}

data "aws_iam_policy_document" "s3_iam_iac_policy_document" {
  /*== Empêcher l'accès non SSL ==*/
  statement {
    sid    = "DenyNoSSL"
    effect = "Deny"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["*"]
    resources = ["arn:aws:s3:::${var.iac_bucket_name}/*"]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
  /*== Droit aux services AWS de la region à écrire ==*/
  statement {
    sid    = "${var.aws_account}-GetPut"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account}:root",
                     "arn:aws:iam::445499750500:user/cs_terraform_mike",
                     "arn:aws:iam::805238525761:user/cs_iac_075304769642",
                     "arn:aws:iam::805238525761:user/cs_iac_441707074192",
                     "arn:aws:iam::805238525761:user/cs_iac_445499750500",
                     "arn:aws:iam::805238525761:user/cs_iac_805238525761"
      ]
    }
    actions   = ["s3:GetObject", "s3:GetObjectAcl", "s3:PutObject", "s3:PutObjectAcl"]
    resources = ["arn:aws:s3:::${var.iac_bucket_name}/*"]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["true"]
    }
  }
  statement {
    sid    = "${var.aws_account}-List"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account}:root",
                     "arn:aws:iam::445499750500:user/cs_terraform_mike",
                     "arn:aws:iam::805238525761:user/cs_iac_075304769642",
                     "arn:aws:iam::805238525761:user/cs_iac_441707074192",
                     "arn:aws:iam::805238525761:user/cs_iac_445499750500",
                     "arn:aws:iam::805238525761:user/cs_iac_805238525761"
      ]
    }
    actions   = ["s3:ListBucket"]
    resources = [
      "arn:aws:s3:::${var.iac_bucket_name}/*",
      "arn:aws:s3:::${var.iac_bucket_name}"
      ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["true"]
    }
  }
}

resource "aws_s3_bucket_public_access_block" "iac_bucket" {
  bucket = aws_s3_bucket.iac_bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "iac_bucket_acces_policy" {
  bucket = aws_s3_bucket.iac_bucket.id
  policy = data.aws_iam_policy_document.s3_iam_iac_policy_document.json
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.iac_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

/*
data "aws_iam_policy_document" "s3_iam_account_iac_policy_document" {
  #== Droit aux services AWS de la region à écrire ==
  for_each = var.aws_org_accounts
    statement {
      sid        = "${each.value.id}-GetPut"
      effect     = "Allow"
      principals {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${each.value.id}:user/cs_iac_${each.value.id}"]
      }
      actions   = ["s3:GetObject", "s3:PutObject"]
      resources = ["arn:aws:s3:::${var.iac_bucket_name}/${each.value.id}/*"]
      condition {
        test     = "Bool"
        variable = "aws:SecureTransport"
        values   = ["true"]
      }
    }
    statement {
      sid        = "${each.value.id}-List"
      effect     = "Allow"
      principals {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${each.value.id}:user/cs_iac_${each.value.id}"]
      }
      actions   = ["s3:ListBucket"]
      resources = ["arn:aws:s3:::${var.iac_bucket_name}/${each.value.id}"]
      condition {
        test     = "Bool"
        variable = "aws:SecureTransport"
        values   = ["true"]
      }
    }
}

resource "aws_s3_bucket_policy" "add_iac_bucket_acces_policy" {
  for_each = data.aws_iam_policy_document.s3_iam_account_iac_policy_document
    bucket = aws_s3_bucket.iac_bucket.id
    policy = each.value.json
}
*/
