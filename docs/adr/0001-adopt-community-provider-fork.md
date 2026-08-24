# Adopt Community Terraform Provider Fork for Pingdom

## Status

Accepted

## Context

Contentful uses Pingdom for uptime monitoring and needs to manage checks, contacts, teams, and maintenance windows through Terraform. No official provider exists. The most complete community provider (`DrFaust92/terraform-provider-pingdom`, built on `russellcardullo`'s 2014 original) was not actively maintained to the level needed for production use.

## Options Considered

| Option | Pros | Cons |
| --- | --- | --- |
| Fork and maintain internally | Immediate coverage, proven API mappings | Ongoing maintenance, inherits design debt |
| Build from scratch with terraform-plugin-framework | Modern framework, clean design | Large upfront effort, delays production use |
| Use community provider as-is | Zero maintenance | No control over releases, abandonment risk |

## Decision

Fork and maintain internally. The fork is based on the `mbarper/terraform-provider-pingdom` lineage (consolidating `russellcardullo` and `DrFaust92` work). This gives immediate production use with full control over fixes and releases.

## Consequences

- Enables reliable Pingdom monitoring-as-code with a controlled release cadence.
- Makes future migration to `terraform-plugin-framework` harder — every resource must be rewritten.
- Requires keeping the `go-pingdom` client aligned with Pingdom API changes and maintaining Renovate-driven dependency updates.

## Revisit Conditions

Re-evaluate if Pingdom publishes an official provider, if `terraform-plugin-sdk/v2` reaches end-of-life, or if maintenance cost exceeds a rewrite.
