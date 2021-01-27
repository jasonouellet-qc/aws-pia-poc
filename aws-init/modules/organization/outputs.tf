# === ARN de l'organisation ===
output "organization_arn" {
  description = "ARN de l'organisation"
  value       = data.aws_organizations_organization.org.arn
}

/*
output "ou" {
  description = "Liste des unités organisationnelles (oU)"
  value = [
    {
      id        = data.aws_organizations_organizational_unit.zones.*.id
      name      = data.aws_organizations_organizational_unit.zones.*.name
      parent_id = data.aws_organizations_organizational_unit.zones.*.parent_id
    }
  ]
}

output "org_accounts" {
  description = "Liste des comptes de l'organisation"
  value = {
    for account in data.aws_organizations_organization.org.non_master_accounts :
    account.name => account.id
  }
}
*/
