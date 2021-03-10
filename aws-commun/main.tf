#############################################################################
# VARIABLES LOCALES
#############################################################################

locals {
  tags = {
    Project     = var.projet
    Environment = var.environnement
    Terraform   = true
  }
}

#############################################################################
# MODULES
#############################################################################
module "dns" {
  source = "./modules/dns"
  providers = {
    aws.root = aws.root,
    aws.iac  = aws.iac
  }

  tags = local.tags
}
module "ses" {
  source = "./modules/ses"
  providers = {
    aws = aws.iac
  }
  projet = var.projet

  domaines          = module.dns.sub_domain_name
  courriels_sortant = { eric = { "courriel" = "eric.labranche@mtess.gouv.qc.ca" } }

  tags = local.tags
}
