variable "projet" {
  type        = string
  description = "Code de projet"
}

variable "courriels_sortant" {
  type = map(any)
}

variable "domaines" {
  type        = string
  description = "Domaine a valider"
  default     = "notification.gouv.qc.ca"
}

variable "tags" {
  description = "Tags à appliquer sur toutes les ressources"
}
