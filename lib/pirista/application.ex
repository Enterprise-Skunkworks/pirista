defmodule Pirista.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pirista.Supervisor]
    children =
      [
        # Children for all targets
        # Starts a worker by calling: Pirista.Worker.start_link(arg)
        # {Pirista.Worker, arg},
      ] ++ children(target())

    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: Pirista.Worker.start_link(arg)
      # {Pirista.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Children for all targets except host
      # Starts a worker by calling: Pirista.Worker.start_link(arg)
      # {Pirista.Worker, arg},
    ]
  end

  def target() do
    Application.get_env(:pirista, :target)
  end
end
