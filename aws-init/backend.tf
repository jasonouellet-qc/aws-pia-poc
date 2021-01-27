#############################################################################
# BACKEND
#############################################################################

terraform {
  /*
    backend "s3" {
    profile        = "PIA" #Changer pour un profile IaC seulement
    region         = "ca-central-1"
    bucket         = "pia-iac-bucket"
    key            = "AWS/MTESS/PIA/POC/init_compte_terraform.tfstate"
    dynamodb_table = "TerraformLockState"
  }

*/

  backend "local" {
    path = "init_compte_terraform.tfstate"
  }
}

