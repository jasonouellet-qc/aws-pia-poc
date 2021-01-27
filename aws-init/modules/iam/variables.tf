#############################################################################
# VARIABLES
#############################################################################

variable "tags" {
  description = "Tags a assigner a toutes les ressources"
}

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

##### Profil de connexion #####

variable "aws_profile" {
  type        = string
  description = "Nom du profil de connexion"
}

variable "role_name" {
  type        = string
  description = "Rôle de la connexion"
}

##########

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

