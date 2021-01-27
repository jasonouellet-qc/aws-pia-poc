#############################################################################
# VARIABLES
#############################################################################

##### Générales #####

variable "region" {
  type        = string
  description = "Région de déploiement"
  default     = "ca-central-1"
}

variable "projet" {
  type        = string
  description = "Code de projet"
}

variable "environnement" {
  type        = string
  description = "Code de l'environnement"
}

##### Profil de connexion #####

variable "aws_profile_root" {
  type        = string
  description = "Nom du profil de connexion ROOT"
}

variable "aws_profile" {
  type        = string
  description = "Nom du profil de connexion IaC"
}

variable "account_id" {
  type        = string
  description = "Compte AWS"
}

variable "role_name" {
  type        = string
  description = "Rôle de la connexion"
}

variable "session_name" {
  type        = string
  description = "External identifier to use when assuming the role"
}

variable "external_id" {
  type        = string
  description = "External identifier to use when assuming the role"
}

##### Variables Organization #####

variable "liste_ou" {
  description = "Liste des OU a creer"
  default     = ["Dev"]
}

#TODO: Sortir les valeurs hardcodés
variable "liste_comptes" {
  description = "Liste des comptes a creer"
  type        = map(any)
  default = {
    pocpia = {
      name  = "PocPia"
      ou    = "MTESS"
      email = "poc005.pfg@itq.gouv.qc.ca"
    }
  }
}

##### Variables IAM #####

variable "aws_groups" {
  type = map(object({
    name       = string
    policy_arn = string
    path       = string
  }))
  description = "Liste des groupes d'usagers"
}

variable "aws_users" {
  type = map(object({
    name  = string
    group = string
    path  = string
  }))
  description = "Liste des usagers à créer"
}

variable "aws_users_service" {
  type = map(object({
    name  = string
    group = string
    path  = string
  }))
  description = "Liste des usagers de type service à créer"
}

##### Budget #####

variable "budget_limit_amount" {
  description = "Limite du budget"
}

variable "budget_notification_threshold" {
  description = "Pourcentage déclencheur de la notification"
}

variable "budget_notification_subscriber_emails" {
  description = "Liste des courriels pour envoyer les notifications"
}

##### S3 #####
/*== IaC tfstate ==*/

variable "terraform_bucket_name" {
  description = "Nom du bucket S3 des fichiers Terraform"
}
/*== Logs ==*/

variable "log_bucket_name" {
  description = "Nom du bucket S3 de logs"
}

variable "log_period" {
  description = "Période de conservation des fichiers de log (jr)"
}

##### Config #####
#TODO: Rapporter les paramêtres de retenu des config dans le bucket
variable "config_bucket_prefix" {
  description = "Préfixe pour le nom du bucket de config"
}

variable "config_bucket_key_prefix" {
  description = "Préfixe de clé dans le bucket de config"
}
