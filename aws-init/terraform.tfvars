#############################################################################
# VALEURS À INJECTER DANS LES VARIABLES
#############################################################################

##### Général #####

region           = "ca-central-1"
aws_profile_root = "PDM-root"
aws_profile      = "PDM-Dev"
account_id       = "441707074192"
role_name        = "root"
session_name     = "terraform"
external_id      = "root"
projet           = "PIA"
environnement    = "POC"

##### Organization #####

liste_ou = [
  "MTESS",
]

##### IAM #####

aws_groups = {
  dev = {
    name       = "developpeurs"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    path       = "/users/"
  },
  audit = {
    name       = "auditeurs"
    policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    path       = "/users/audit/"
  },
  iac = {
    name       = "iac"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    path       = "/users/iac/"
  },
}

aws_users = {
  kaiss = {
    name  = "kaiss.berkani"
    group = "developpeurs"
    path  = "/users/"
  },
  eric = {
    name  = "eric.labranche"
    group = "developpeurs"
    path  = "/users/"
  },
  sylvain = {
    name  = "sylvain.carrier"
    group = "developpeurs"
    path  = "/users/"
  },
  yan = {
    name  = "yan.boulanger"
    group = "developpeurs"
    path  = "/users/"
  },
  francois = {
    name  = "francois.cote"
    group = "developpeurs"
    path  = "/users/"
  },
  julien = {
    name  = "julien.moulin"
    group = "developpeurs"
    path  = "/users/"
  },
}

aws_users_service = {
  cs_iac = {
    name  = "cs_iac"
    group = "iac"
    path  = "/users/iac/"
  }
}

##### Budget #####

budget_limit_amount           = "2000.0"
budget_notification_threshold = "65"
budget_notification_subscriber_emails = [
  "poc005.pfg@itq.gouv.qc.ca"
]

##### S3 #####
### IaC tfstate ###
terraform_bucket_name = "pia-iac-bucket"

### Logs ###
log_bucket_name = "pia-log-bucket"
log_period      = 15

##### Config #####
config_bucket_prefix     = "pia-config-bucket"
config_bucket_key_prefix = "config"
#TODO: Rapporter les paramêtres de retenu des config dans le bucket
