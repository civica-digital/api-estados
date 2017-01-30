defmodule Api.TownController do
    use Api.Web, :controller

    alias Api.Town

    def index(conn, _params) do
        towns = Repo.all(Town) |> Repo.preload([:state])
        render conn, "index.json", towns: towns
    end
end