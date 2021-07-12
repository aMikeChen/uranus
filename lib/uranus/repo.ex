defmodule Uranus.Repo do
  use Ecto.Repo,
    otp_app: :uranus,
    adapter: Ecto.Adapters.Postgres
end
