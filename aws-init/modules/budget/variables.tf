variable "tags" {
  description = "Tags a assigner a toutes les ressources"
}

variable "projet" {
  description = "Code de projet"
}

variable "limit_amount" {
  description = "Limite du budget"
}

variable "notification_threshold" {
  description = "Pourcentage déclencheur de la notification"
}

variable "notification_subscriber_emails" {
  description = "Liste des courriels pour envoyer les notifications"
}
