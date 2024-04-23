# PoolexPromEx

This is a plugin for your application to collect [Poolex's](https://github.com/general-CbIC/poolex) metrics with PromEx.

## Requirements

| Requirement | Version |
|-------------|---------|
| Erlang/OTP  | >= 24   |
| Elixir      | >= 1.11 |

## Installation

To use this plugin, you need to add `:poolex_prom_ex` to your dependencies in `mix.exs`:

  ```elixir
  defp deps do
    [
      {:poolex_prom_ex, "~> 0.1.0"}
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
