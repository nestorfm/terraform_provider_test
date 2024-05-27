terraform {
  required_providers {
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = ">= 3.12.2"
    }
  }
}
provider "pagerduty" {
  token = var.PD_TOKEN
}

variable "PD_TOKEN" {
  sensitive = true
}