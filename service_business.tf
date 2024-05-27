resource "pagerduty_business_service" "IT" {
  name = "IT Services"
  description = "All IT services at ACME inc."
  point_of_contact = pagerduty_team.helpdesk.name #ask the helpdesk for help with IT services
  team = pagerduty_team.IT.id
}