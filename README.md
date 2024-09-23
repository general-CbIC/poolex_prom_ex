# PoolexPromEx

![Build and static analyze](https://github.com/general-CbIC/poolex_prom_ex/actions/workflows/ci-build.yml/badge.svg)
[![hex.pm version](https://img.shields.io/hexpm/v/poolex_prom_ex.svg?style=flat)](https://hex.pm/packages/poolex_prom_ex)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg?style=flat)](https://hexdocs.pm/poolex_prom_ex/)
[![License](https://img.shields.io/hexpm/l/poolex_prom_ex.svg?style=flat)](https://github.com/general-CbIC/poolex_prom_ex/blob/main/LICENSE)
[![Total Download](https://img.shields.io/hexpm/dt/poolex_prom_ex.svg?style=flat)](https://hex.pm/packages/poolex_prom_ex)

This is a plugin for your application to collect [Poolex's](https://github.com/general-CbIC/poolex) metrics with [PromEx](https://github.com/akoutmos/prom_ex).

## Requirements

| Requirement | Version   |
|-------------|-----------|
| Erlang/OTP  | >= 24     |
| Elixir      | >= 1.12   |
| Poolex      | ~> 1.0    |

## Installation

To use this plugin, you need to add `:poolex_prom_ex` to your dependencies in `mix.exs`:

  ```elixir
  defp deps do
    [
      {:poolex_prom_ex, "~> 0.2.0"}
    ]
  end
  ```

  Then you need to add this plugin to plugins list in your `PromEx` configuration:

  ```elixir
  defmodule MyCoolApp.PromEx do
    use PromEx, otp_app: :my_cool_app

    @impl PromEx
    def plugins do
      [
        Poolex.PromEx
      ]
    end
  end
  ```

Additional information about `PromEx` installation and configuration can be found in the `PromEx` documentation: <https://hexdocs.pm/prom_ex/readme.html#installation>.
