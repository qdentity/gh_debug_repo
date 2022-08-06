defmodule GhDebug.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GhDebug.Repo,
      # Start the Telemetry supervisor
      GhDebugWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GhDebug.PubSub},
      # Start the Endpoint (http/https)
      GhDebugWeb.Endpoint
      # Start a worker by calling: GhDebug.Worker.start_link(arg)
      # {GhDebug.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GhDebug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GhDebugWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
