/*====== Budgets ======*/
resource "aws_budgets_budget" "cout-global" {
  name        = "${var.projet}-Budget-Mensuel-Global"
  budget_type = "COST"
  #  cost_filters = {}
  cost_types {
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = false
    include_upfront            = true
    use_blended                = false
  }

  limit_amount      = var.limit_amount
  limit_unit        = "USD"
  time_period_start = "2020-10-01_12:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.notification_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.notification_subscriber_emails
  }

}


