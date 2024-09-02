import Config

config :app, Friends.Repo,
  database: "app_repo",
  username: "postgres",
  password: "secretSauce",
  hostname: "localhost"

config :app, ecto_repos: [Friends.Repo]

import_config "#{config_env()}.exs"
