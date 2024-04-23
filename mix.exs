defmodule PoolexPromEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :poolex_prom_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:poolex, "~> 0.9.0", optional: true},
      {:prom_ex, "~> 1.0"},

      # Development deps
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:doctor, ">= 0.0.0", only: [:dev], runtime: false},
      {:ex_check, "~> 0.15.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:makeup_diff, ">= 0.0.0", only: [:dev], runtime: false}
    ]
  end
end
