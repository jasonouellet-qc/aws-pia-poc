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
module "organization" {
  source = "./modules/organization"
  providers = {
    aws = aws.root
  }
  region        = var.region
  projet        = var.projet
  liste_ou      = var.liste_ou
  liste_comptes = var.liste_comptes

  tags = local.tags
}

module "iam" {
  source = "./modules/iam"
  providers = {
    aws = aws.iac
  }
  projet            = var.projet
  aws_profile       = var.aws_profile
  role_name         = "AdminPocPia"
  region            = var.region
  aws_groups        = var.aws_groups
  aws_users         = var.aws_users
  aws_users_service = var.aws_users_service

  tags = local.tags
}

module "budget" {
  source = "./modules/budget"
  providers = {
    aws = aws.iac
  }
  projet                         = var.projet
  limit_amount                   = var.budget_limit_amount
  notification_threshold         = var.budget_notification_threshold
  notification_subscriber_emails = var.budget_notification_subscriber_emails

  tags = local.tags
}
/*
module "backend" {
  depends_on = [module.s3]

  source          = "./modules/backend"
  projet          = var.projet
  aws_account     = var.account_id 
  iac_bucket_name = var.terraform_bucket_name
  log_bucket_name = module.s3.s3_log_bucket_name

  tags = local.tags
}

module "s3" {
  depends_on = [module.organization]

  source          = "./modules/s3"
  projet          = var.projet
  aws_account     = var.account_id
  iac_bucket_name = var.terraform_bucket_name #TODO: Déplacer dans le module "backend"
  log_bucket_name = var.log_bucket_name
  log_period      = var.log_period
  #TODO: Obtenir les comptes dans le output du module "organization"
  aws_org_accounts = {
    partage = { id = "445499750500" },
    dev     = { id = "805238525761" },
    devdb   = { id = "774078772134" },
  }

  tags = local.tags
}

module "config" {
  source            = "./modules/config"
  projet            = var.projet
  aws_account       = var.account_id
  region            = var.region
  bucket_prefix     = var.config_bucket_prefix
  bucket_key_prefix = var.config_bucket_key_prefix

  tags = local.tags
}

module "cloudtrail" {
  depends_on = [module.s3]

  source          = "./modules/cloudtrail"
  projet          = var.projet
  account         = var.account_id
  region          = var.region
  log_bucket_name = module.s3.s3_log_bucket_name

  tags = local.tags
}
*/
