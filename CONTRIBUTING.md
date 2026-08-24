# Contributing

## Prerequisites

| Tool | Notes |
| --- | --- |
| Go | Version specified in `go.mod` |
| GNU Make | Build automation |
| golangci-lint | Linting (CI runs this on every PR) |
| Terraform | Required only for manual end-to-end testing |

## Getting Started

```bash
git clone git@github.com:contentful/terraform-provider-pingdom.git
cd terraform-provider-pingdom
make mod
make build
make test
```

## Development Workflow

1. Create a feature branch from `master`.
2. Make your changes in the `pingdom/` package.
3. Add or update the corresponding `_test.go` file.
4. Run the verification loop: `make mod && make build && make test && make lint`
5. Open a PR against `master`.

## Commands

| Task | Command |
| --- | --- |
| Tidy and vendor dependencies | `make mod` |
| Build provider binary | `make build` |
| Run unit tests | `make test` |
| Run acceptance tests | `make testacc` |
| Lint | `make lint` |
| Install locally | `make install` |
| Build Linux binary (Docker) | `make build-linux` |

## Testing

- **Unit tests**: `make test` — runs all tests with coverage.
- **Acceptance tests**: `make testacc` — runs against the real Pingdom API. Requires `PINGDOM_API_TOKEN` and SolarWinds credentials set as environment variables. Set `TF_ACC=1`.
- **Test files**: co-located with source as `*_test.go` in `pingdom/`.
- **Single test**: `make testacc TESTS=TestAccPingdomCheck_basic`

## Adding a New Resource

1. Create `pingdom/resource_pingdom_<name>.go` with CRUD functions.
2. Create `pingdom/resource_pingdom_<name>_test.go` with acceptance tests.
3. Register the resource in `provider.go` under `ResourcesMap`.
4. Add documentation in `docs/resources/<name>.md`.
5. Add an example in `examples/`.

## Adding a New Data Source

1. Create `pingdom/data_source_pingdom_<name>.go`.
2. Create `pingdom/data_source_pingdom_<name>_test.go`.
3. Register in `provider.go` under `DataSourcesMap`.
4. Add documentation in `docs/data-sources/<name>.md`.

## Code Style

- Follow standard Go conventions (`gofmt`, `go vet`).
- golangci-lint enforces additional rules — run `make lint` before pushing.
- Keep resource files self-contained: schema definition and CRUD in one file.

## Pull Requests

- Target `master`.
- Use conventional commit messages: `feat:`, `fix:`, `chore:`, `docs:`.
- Each PR must pass CI (test + lint).
- Keep PRs focused — one resource or feature per PR makes review faster.

## Releases

Releases are automated. When a version tag (`v*`) is pushed, GoReleaser builds multi-platform binaries, signs them with GPG, and publishes to the Terraform Registry. Do not manually create release artifacts.
