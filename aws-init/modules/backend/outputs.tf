output "s3_iac_bucket_name" {
  value = aws_s3_bucket.iac_bucket.bucket
}

output "s3_iac_bucket_arn" {
  value = aws_s3_bucket.iac_bucket.arn
}
