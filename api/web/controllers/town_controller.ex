defmodule Api.TownController do
    use Api.Web, :controller
    alias Api.Town

    def index(conn, _params) do
        towns = Repo.all(Town) |> Repo.preload([:state]) |> Repo.preload([:constituencies])
        render conn, "index.json", towns: towns
    end

    def show(conn, %{"id" => town}) do
        town = Api.Repo.get!(Town, town) |> Repo.preload([:state]) |> Repo.preload([:constituencies])
        render conn, "show.json", town: town 
    end
end
