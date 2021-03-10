#############################################################################
# PROVIDERS
#############################################################################

provider "aws" {
  alias   = "root"
  region  = var.region
  profile = var.aws_profile
  #  access_key = var.aws_access_key
  #  secret_key = var.aws_secret_key

  #  assume_role {
  #    role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
  #    session_name = var.session_name
  #    external_id  = var.external_id
  #  }

}

provider "aws" {
  alias   = "iac"
  region  = var.region
  profile = var.aws_profile
  #  access_key = var.aws_access_key
  #  secret_key = var.aws_secret_key

  assume_role {
    role_arn     = "arn:aws:iam::714227420245:role/AdminPocPia" #TODO: module.organization.accounts[0].role_name
    session_name = var.session_name
    #  external_id  = var.external_id
  }
}
