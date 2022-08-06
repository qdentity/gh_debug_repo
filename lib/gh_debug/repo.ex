defmodule GhDebug.Repo do
  use Ecto.Repo,
    otp_app: :gh_debug,
    adapter: Ecto.Adapters.Postgres
end
