---
layout: "pingdom"
page_title: "Bitbucket: pingdom_integrations"
sidebar_current: "docs-pingdom-data-integrations"
description: |-
  Provides a data for a Bitbucket integrations
---

# pingdom\_integrations

Provides a way to fetch data on a integrations.

## Example Usage

```hcl
data "pingdom_integrations" "example" {}
```

## Argument Reference

The following arguments are supported:

No arguments can be passed.

## Attributes Reference

* `names` - The integrations names.
* `ids` - The integrations ids.
