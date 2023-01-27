---
layout: "pingdom"
page_title: "Bitbucket: pingdom_integration"
sidebar_current: "docs-pingdom-data-integration"
description: |-
  Provides a data for a Bitbucket integration
---

# pingdom\_integration

Provides a way to fetch data on a integration.

## Example Usage

```hcl
data "pingdom_integration" "example" {
  name = pingdom_integration.example.name
}
```

## Argument Reference

The following arguments are supported:

* `name` - (Required) The integration name to look up.

## Attributes Reference

* `provider_name` - The integration provider name.
* `active` - Whether the integration is active.
* `url` - The integration url.
