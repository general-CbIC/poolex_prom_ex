defmodule PoolexPromEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :poolex_prom_ex,
      deps: deps(),
      description: "PromEx integration for Poolex",
      docs: docs(),
      elixir: "~> 1.12",
      elixirc_options: [
        warnings_as_errors: true
      ],
      package: package(),
      source_url: "https://github.com/general-CbIC/poolex_prom_ex",
      start_permanent: Mix.env() == :prod,
      version: "0.2.1"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poolex, "~> 0.10.0"},
      {:prom_ex, "~> 1.0"},

      # Development deps
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:doctor, ">= 0.0.0", only: [:dev], runtime: false},
      {:ex_check, "~> 0.16.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:makeup_diff, ">= 0.0.0", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://github.com/general-CbIC/poolex_prom_ex/blob/develop/CHANGELOG.md",
        "GitHub" => "https://github.com/general-CbIC/poolex_prom_ex",
        "Sponsor" => "https://github.com/sponsors/general-CbIC"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md"
      ]
    ]
  end
end
