resource "pagerduty_schedule" "HelpDesk_Day_Shift" {
  name = "Helpdesk Day Shift Rotation"
  time_zone = "America/New_York"
  layer {
    name = "Day Shift"
    start = "2015-11-06T00:08:00-05:00" #starts a 8am EST
    rotation_virtual_start = "2015-11-06T00:08:00-05:00"
    rotation_turn_length_seconds = 86400
    users = local.helpdesk_team_a # this is the locally defined Rotation of users in this example

    restriction {
      type = "daily_restriction"
      start_time_of_day = "08:00:00" #at 8am the day shift goes oncall
      duration_seconds = 43200
    }
  }
  teams = [pagerduty_team.helpdesk_team_a.id]
}

resource "pagerduty_schedule" "HelpDesk_Night_Shift" {
  name = "Helpdesk Night Shift Rotation"
  time_zone = "America/New_York"
  layer {
    name = "Night Shift"
    start = "2015-11-06T00:20:00-05:00" #starts a 8am EST
    rotation_virtual_start = "2015-11-06T00:20:00-05:00"
    rotation_turn_length_seconds = 86400
    users = local.helpdesk_team_b # this is the locally defined Rotation of users in this example

    restriction {
      type = "daily_restriction"
      start_time_of_day = "20:00:00" #at 8am the day shift goes oncall
      duration_seconds = 43200
    }
  }
  teams = [pagerduty_team.helpdesk_team_b.id]
}

resource "pagerduty_schedule" "it_crm" {
  name = "IT CRM"
  time_zone = "America/New_York"

  layer {
    name = "Weekly On-call"
    start = "2015-11-06T20:00:00-05:00" #starts at 8pm
    rotation_virtual_start = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 604800
    users = local.IT_crm # this is the locally defined rotation of users for this example
  }

  teams = [pagerduty_team.it_crm.id] #this is the team ID
}

resource "pagerduty_schedule" "sucks_to_be_fred" {
  name = "Fred"
  time_zone = "America/New_York"

  layer {
    name = "Always On-call"
    start = "2015-11-06T20:00:00-05:00" #starts at 8pm
    rotation_virtual_start = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 604800
    users = [pagerduty_user.helpdesk_user02.id]
  }
}

resource "pagerduty_schedule" "IT" {
  name = "IT"
  time_zone = "America/New_York"

  layer {
    name = "Always On-call"
    start = "2015-11-06T20:00:00-05:00" #starts at 8pm
    rotation_virtual_start = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 604800
    users = [pagerduty_user.helpdesk_user04.id]
  }
}
########################
# User - Team Rotation #
########################

locals {
  helpdesk_team_a = [
    pagerduty_user.helpdesk_user01.id,
    pagerduty_user.helpdesk_user02.id
  ]
  helpdesk_team_b = [
    pagerduty_user.helpdesk_user03.id,
    pagerduty_user.helpdesk_user04.id
  ]
  IT_crm = [
    pagerduty_user.it_user01.id,
    pagerduty_user.it_user02.id
  ]
}