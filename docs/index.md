---
layout: "pingdom"
page_title: "Provider: Pingdom"
sidebar_current: "docs-pingdom-index"
description: |-
  The Pingdom provider to interact with checks, users, etc..
---

# Pingdom Provider

The Pingdom provider allows you to manage resources including checks,
users, and teams.

Use the navigation to the left to read about the available resources.

## Example Usage

```terraform
terraform {
  required_providers {
    pingdom = {
      source  = "drfaust92/pingdom"
    }
  }
}

variable "pingdom_api_token" {}
variable "solarwinds_user" {}
variable "solarwinds_passwd" {}

provider "pingdom" {
  api_token         = var.pingdom_api_token
  solarwinds_user   = var.solarwinds_user
  solarwinds_passwd = var.solarwinds_passwd
}

resource "pingdom_check" "example" {
  type        = "http"
  name        = "my http check"
  host        = "example.com"
  resolution  = 5
}

resource "pingdom_check" "example_with_alert" {
  type                     = "http"
  name                     = "my http check"
  host                     = "example.com"
  resolution               = 5
  sendnotificationwhendown = 2 # alert after 5 mins, with resolution 5*(2-1)

  integrationids = [
    12345678,
    23456789
  ]
  userids = [
    24680,
    13579
  ]
}
```

## Argument Reference

The following arguments are supported in the `provider` block:

* `api_token` - (Optional) API Token to use to authenticate. You can
also set this via the environment variable: `PINGDOM_API_TOKEN`

* `solarwinds_user` - (Optional) Solarwinds user. You can
also set this via the environment variable: `SOLARWINDS_USER`

* `solarwinds_passwd` - (Optional) Solarwinds password. You can
also set this via the environment variable: `SOLARWINDS_PASSWD`

* `solarwinds_org_id` - (Optional) Solarwinds Org Id. You can
also set this via the environment variable: `SOLARWINDS_ORG_ID`
