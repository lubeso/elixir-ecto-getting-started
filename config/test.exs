import Config

config :app, Friends.Repo,
  database: "app_repo",
  username: "postgres",
  password: "secretSauce",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
