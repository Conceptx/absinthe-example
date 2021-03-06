# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gazol,
  ecto_repos: [Gazol.Repo]

# Configures the endpoint
config :gazol, GazolWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "moBK9H/abvBrr+lvlfBjeQH/+sjyLIYk39nEiiJINXmmEU5YlvJipXiOyesbRgt5",
  render_errors: [view: GazolWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Gazol.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Guardian config
config :gazol, Gazol.Guardian,
  issuer: "gazol",
  secret_key: "5e2Edlj5C904NE3JNVLsO8J5dR0KxZlpj+6XIszykOZNBzyOsW7mL6nhD167UfH6"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
