# Agent Guide

## Quick Reference

| What you need | Where to look |
| --- | --- |
| How this repo is structured | [ARCHITECTURE.md](./ARCHITECTURE.md) |
| How to build/test/run | [CONTRIBUTING.md](./CONTRIBUTING.md) |
| Why decisions were made | [docs/adr/](./docs/adr/) |
| What this repo does | [README.md](./README.md) |
| Terraform resource docs | [docs/](./docs/) |
| Usage examples | [examples/](./examples/) |

## Guardrails

- Use `go mod tidy && go mod vendor` after any dependency change — vendored dependencies are committed.
- Do not upgrade from `terraform-plugin-sdk/v2` to `terraform-plugin-framework` without team approval — the migration is non-trivial and affects every resource.
- Do not modify `.goreleaser.yml` GPG signing config — releases are signed with a CI-managed key.
- Every resource and data source must have a corresponding `_test.go` acceptance test file.
- Provider authentication supports two modes (Pingdom API token, SolarWinds credentials) — both must remain optional and backward-compatible.

## Safety and Permissions

- Never commit real API tokens or SolarWinds credentials. Use environment variables: `PINGDOM_API_TOKEN`, `SOLARWINDS_USER`, `SOLARWINDS_PASSWD`, `SOLARWINDS_ORG_ID`.
- Ask before changing CI workflows — they control GPG-signed releases to the Terraform Registry.
- Ask before removing or renaming any exported resource attribute — downstream Terraform state depends on the schema.

## Build and Quality

```bash
make mod && make build && make test && make lint
```
