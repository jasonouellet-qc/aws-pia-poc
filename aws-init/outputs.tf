output "organization_arn" {
  description = "ARN de l'organisation"
  value       = module.organization.organization_arn
}
/*
output "iac_role_arn" {
  description = "ARN du rôle de déploiement IaC"
  value       = module.organization.org_accounts[*].role_names
}

output "organisation_accounts" {
  description = "Liste MAP des comptes de l'organisation"
  value       = module.organization.org_accounts
}
*/
output "users_logins_passwords" {
  description = "Liste des mots de passes encodes"
  value       = module.iam.users_logins_passwords
}
/*
output "s3_iac_bucket_name" {
  value = module.backend.s3_iac_bucket_name
}

output "s3_log_bucket_name" {
  value = module.s3.s3_log_bucket_name
}

output "s3_log_bucket_arn" {
  value = module.s3.s3_log_bucket_arn
}
*/
