variable "projet" {
  description = "Code de projet"
}

variable "aws_account" {
  description = "Compte AWS"
}

variable "tags" {
  description = "Tags à appliquer sur toutes les ressources"
}

variable "iac_bucket_name" {
  description = "Nom du bucket S3 pour les fichiers d'état d'infrastructure"
  default     = "iac-bucket"
}

variable "lock_table_name" {
  description = "Nom de la table permettant de barrer un fichier d'état IaC"
  default     = "TerraformLockState"
}

variable "log_bucket_name" {
  description = ""
  default     = "log-bucket"
}