# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gitoogl,
  ecto_repos: [Gitoogl.Repo]

# Configures the endpoint
config :gitoogl, GitooglWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rXN1/pMEaNh7/Kw5fD2eTXOUlqtc1eW9kHcu5KVfxIJaktPkGpyMGSNPhKUvVmRY",
  render_errors: [view: GitooglWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gitoogl.PubSub,
  live_view: [signing_salt: "OAVCSz5q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
