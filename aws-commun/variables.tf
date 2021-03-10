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

