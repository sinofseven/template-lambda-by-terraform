# ================================================================
# For Slack
# ================================================================

resource "aws_cloudwatch_event_connection" "slack_dummy" {
  authorization_type = "API KEY"
  name               = "slack-dummy"

  auth_parameters {
    api_key {
      key   = "DUMMY"
      value = "dummy"
    }
  }
}

# ================================================================
# Slack Error Notifier
# ================================================================

resource "aws_cloudwatch_event_bus" "slack_error_notifier" {
  name = "error_notifier"
}

module "slack_error_notifier_01" {
  source = "../events_slack_webhook_destination"

  slack_incoming_webhook_url = var.slack_incoming_webhook_error_notifier_01
  api_destination_name       = "error_notifier_01"

  event_bus_name             = aws_cloudwatch_event_bus.slack_error_notifier.name
  iam_role_arn               = aws_iam_role.event_bridge_invoke_api_destination.arn
  connection_arn_slack_dummy = aws_cloudwatch_event_connection.slack_dummy.arn
}