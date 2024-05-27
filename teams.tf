resource "pagerduty_team" "helpdesk" {
  name = "the help desk of ACME inc"
  description = "Product and Engineering"
}

resource "pagerduty_team" "helpdesk_team_a" {
  name = "Help Desk team A"
  description = "Help Desk team A"
  parent = pagerduty_team.helpdesk.id
}

resource "pagerduty_team" "helpdesk_team_b" {
  name = "Help Desk team B"
  description = "Help Desk team B"
  parent = pagerduty_team.helpdesk.id
}

resource "pagerduty_team" "it_crm" {
  name = "IT CRM"
  description = "IT CRM"
}

resource "pagerduty_team" "IT" {
  name = "IT"
  description = "IT"
}

#######################
# User - Team Mapping #
#######################

resource "pagerduty_team_membership" "team_helpdesk_user_01" {
  user_id = pagerduty_user.helpdesk_user01.id
  team_id = pagerduty_team.helpdesk_team_a.id
  role = "responder"
}

resource "pagerduty_team_membership" "team_helpdesk_user_02" {
  user_id = pagerduty_user.helpdesk_user02.id
  team_id = pagerduty_team.helpdesk_team_a.id
  role = "responder"
}
resource "pagerduty_team_membership" "team_helpdesk_user_03" {
  user_id = pagerduty_user.helpdesk_user03.id
  team_id = pagerduty_team.helpdesk_team_b.id
  role = "responder"
}
resource "pagerduty_team_membership" "team_helpdesk_user_04" {
  user_id = pagerduty_user.helpdesk_user04.id
  team_id = pagerduty_team.helpdesk_team_b.id
  role = "responder"
}
resource "pagerduty_team_membership" "team_it_user_01" {
  user_id = pagerduty_user.it_user01.id
  team_id = pagerduty_team.it_crm.id
  role = "responder"
}
resource "pagerduty_team_membership" "team_it_user_02" {
  user_id = pagerduty_user.it_user02.id
  team_id = pagerduty_team.it_crm.id
  role = "responder"
}