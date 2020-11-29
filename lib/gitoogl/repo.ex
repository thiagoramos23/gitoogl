defmodule Gitoogl.Repo do
  use Ecto.Repo,
    otp_app: :gitoogl,
    adapter: Ecto.Adapters.Postgres
end
