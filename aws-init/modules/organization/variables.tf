#############################################################################
# VARIABLES
#############################################################################

variable "region" {
  type        = string
  description = "Région de déploiement"
  default     = "ca-central-1"
}

variable "projet" {
  type        = string
  description = "Code de projet"
}

variable "tags" {
  description = "Tags a assigner a toutes les ressources"
}

variable "liste_ou" {
  description = "Liste des OU a creer"
  default = [
    "dev",
    "test",
    "prod"
  ]
}

variable "liste_comptes" {
  description = "Liste des comptes a creer"
  type        = map
  default = {
    dev = {
      name        = "dev"
      environment = "Dev"
      email       = "dev@dev.com"
    }
  }
}

