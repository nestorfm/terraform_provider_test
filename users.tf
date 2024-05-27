resource "pagerduty_user" "helpdesk_user01" {
  email = "idab@pd.fake"
  name = "Ida B. Butler"
  role = "limited_user"
}

resource "pagerduty_user" "helpdesk_user02" {
  email = "fred@pd.fake"
  name = "Fred"
  role = "limited_user"
}

resource "pagerduty_user" "helpdesk_user03" {
  email = "paula@pd.fake"
  name = "Paula"
  role = "limited_user"
}

resource "pagerduty_user" "helpdesk_user04" {
  email = "horacio@pd.fake"
  name = "Horacio"
  role = "limited_user"
}

resource "pagerduty_user" "it_user01" {
  email = "yakko@pd.fake"
  name = "Yakko"
  role = "limited_user"
}

resource "pagerduty_user" "it_user02" {
  email = "wakko@pd.fake"
  name = "Wakko"
  role = "limited_user"
}