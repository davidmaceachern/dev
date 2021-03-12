resource "aws_budgets_budget" "cost" {
  name = "Monthly Cost Budget" 
  budget_type  = "COST"
  limit_amount = "1"
  limit_unit   = "USD"
  time_unit = "MONTHLY"
  time_period_start = "2021-03-03_12:00"
  
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50 
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["david.maceachern.tech@gmail.com"]
  }

  cost_types {
    include_credit             = false
    include_discount           = true 
    include_other_subscription = true 
    include_recurring          = true 
    include_refund             = false
    include_subscription       = true
    include_support            = true 
    include_tax                = true
    include_upfront            = true 
    use_blended                = false
  }
}