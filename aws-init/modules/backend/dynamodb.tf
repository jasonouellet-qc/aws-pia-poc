resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.lock_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = false
    #    kms_key_arn = data.aws_kms_key.aws_dynamodb.key_id
  }


  tags = merge(var.tags,
    map("Name", var.lock_table_name)
  )
}

data "aws_iam_policy_document" "dynamodb_iam_iac_policy_document" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
    ]
    resources = ["arn:aws:dynamodb:*:*:table/TerraformLock"]
  }
}
