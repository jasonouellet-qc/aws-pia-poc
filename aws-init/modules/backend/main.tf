/*==== Variables utilisés pour tous les modules ======*/

data "aws_kms_key" "aws_s3" {
  key_id = "alias/aws/s3"
}

data "aws_kms_key" "aws_dynamodb" {
  key_id = "alias/aws/dynamodb"
}
