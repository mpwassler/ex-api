defmodule RiverApi.Repo do
  use Ecto.Repo,
    otp_app: :river_api,
    adapter: Ecto.Adapters.Postgres
end
