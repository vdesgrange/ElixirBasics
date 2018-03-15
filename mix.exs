defmodule TSCProject do
  use Mix.Project

  def project do
    [
      app: :tscproject,
      version: "1.0.0",
      deps: [
        {:apex, "~> 1.2.0", only: [:dev, :test]},
      ]
    ]
  end
end
