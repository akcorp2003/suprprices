# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :suprprices_web,
  namespace: SuprpricesWeb

# Configures the endpoint
config :suprprices_web, SuprpricesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ZAe8w7iE5HJJnfekTNVkcEp6J4L3r7tAn4vOHo43jpvJvQoUN8Wg+INCB2SpLmm",
  render_errors: [view: SuprpricesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SuprpricesWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :suprprices_web, :generators,
  context_app: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
