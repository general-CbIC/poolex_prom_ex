# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A small Hex library: a [PromEx](https://github.com/akoutmos/prom_ex) plugin that exports [Poolex](https://github.com/general-CbIC/poolex) pool metrics to Prometheus. The entire implementation is one module in `lib/poolex_prom_ex.ex`.

## Commands

```bash
mix deps.get
mix compile                  # warnings_as_errors: true — any warning fails the build
mix format                   # uses the Styler plugin, so it rewrites code beyond whitespace
mix test                     # test/poolex_prom_ex_test.exs is currently an empty placeholder
mix test path/to/file_test.exs:LINE   # run a single test
mix check                    # ex_check: compiler, format, credo, dialyzer, doctor, ex_doc, ex_unit
mix credo --strict
mix dialyzer
```

The dev tools (credo, dialyxir, doctor, ex_check, ex_doc, styler) are `only: [:dev]`. Run them in the default dev env, not under `MIX_ENV=test`. `.check.exs` turns off sobelow, mix_audit and gettext.

CI (`.github/workflows/ci-build.yml`) runs two jobs:
- `MIX_ENV=prod mix compile` with only prod deps, across an OTP/Elixir matrix that starts at Elixir 1.17 / OTP 25.
- `mix check` on the newest OTP/Elixir pair in the matrix.

Code has to compile on the oldest version in that matrix. PRs target `develop`. `main` is the release branch.

## Architecture

- The module is named `Poolex.PromEx`, not `PoolexPromEx`. It lives in Poolex's namespace, and users list it as `Poolex.PromEx` in their PromEx `plugins/0`.
- It uses `use PromEx.Plugin` and implements only `event_metrics/1`. That function builds `last_value` metrics from the telemetry event `[:poolex, :metrics, :pool_size]`, tagged by `:pool_id`.
- This plugin never emits anything itself. Poolex fires that event from its own metrics poller (`Poolex.Private.Metrics` in deps), and only for pools started with `pool_size_metrics: true`. The event's measurements are `idle_workers_count`, `busy_workers_count` and `overflowed` (0/1). Before adding or renaming a metric, check the event payload in `deps/poolex/lib/poolex/private/metrics.ex`.
- `plug` is a direct dependency only because `prom_ex` needs it to compile (see CHANGELOG 1.1.0).

## Conventions

- Installation instructions appear twice: in `README.md` (the ex_doc main page) and in the `@moduledoc`. Edit both together, including the `~> X.Y` version in the deps snippet.
- Record user-facing changes in `CHANGELOG.md` under `[Unreleased]`, following the Keep a Changelog format. Bumping a minimum Elixir or Poolex version counts as a breaking change there.
- When the minimum Elixir/OTP versions change, update the README requirements table, `elixir:` in `mix.exs` and the CI matrix together.
