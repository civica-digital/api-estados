use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, Api.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api, Api.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_POSTGRESQL_USERNAME"),
  password: System.get_env("DATABASE_POSTGRESQL_PASSWORD"),
  database: "api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
