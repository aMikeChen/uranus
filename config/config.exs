# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :uranus,
  ecto_repos: [Uranus.Repo]

config :uranus, :coin_cache,
  module: Uranus.Cache.Redis

# Configures the endpoint
config :uranus, UranusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WGBPTBUMdwnptG2jZgNEiyP5jxAOk8GsRdJXhcs2BuGvLHqcoVmpVxIAYL2v/yTe",
  render_errors: [view: UranusWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Uranus.PubSub,
  live_view: [signing_salt: "9oLyyOiX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
