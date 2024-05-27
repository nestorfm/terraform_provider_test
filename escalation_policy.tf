resource "pagerduty_escalation_policy" "helpdesk" {
  name = "Page the Helpdesk"
  num_loops = 1

  rule {
    escalation_delay_in_minutes = 30
    target {
      type = "schedule_reference"
      id = pagerduty_schedule.HelpDesk_Day_Shift.id
    }
    target {
      type = "schedule_reference"
      id = pagerduty_schedule.HelpDesk_Night_Shift.id
    }
  }
  #if the helpdesk doesn't answer fred gets paged
  rule {
    escalation_delay_in_minutes = 1 #fred doesn't get very long to respond, fred is a machine
    target {
      type = "schedule_reference"
      id = pagerduty_schedule.sucks_to_be_fred.id #it really sucks to be fred
    }
  }
}

resource "pagerduty_escalation_policy" "IT" {
  name = "Page IT"
  num_loops = 1

  rule {
    escalation_delay_in_minutes = 30
    target {
      type = "schedule_reference"
      id = pagerduty_schedule.IT.id
    }
  }
  #if the helpdesk doesn't answer fred gets paged
  rule {
    escalation_delay_in_minutes = 1 #fred doesn't get very long to respond, fred is a machine
    target {
      type = "schedule_reference"
      id = pagerduty_schedule.sucks_to_be_fred.id #it really sucks to be fred
    }
  }
}