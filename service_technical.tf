resource "pagerduty_service" "service_mainframe" {
  name = "ACME Mainframe"
  escalation_policy = pagerduty_escalation_policy.IT.id
  alert_creation = "create_alerts_and_incidents"
  incident_urgency_rule {
    type = "constant"
    urgency = "severity_based"
  }

  auto_pause_notifications_parameters {
    enabled = true
    timeout = 300
  }

  alert_grouping_parameters {
    type = "intelligent"
  }
}

resource "pagerduty_service" "web_app_e_commerce" {
  name = "ACME Front End E-Commerce Web Application"
  escalation_policy = pagerduty_escalation_policy.helpdesk.id
  alert_creation = "create_alerts_and_incidents"
  incident_urgency_rule {
    type = "constant"
    urgency = "severity_based"
  }

  auto_pause_notifications_parameters {
    enabled = true
    timeout = 300
  }

  alert_grouping_parameters {
    type = "intelligent"
  }
}