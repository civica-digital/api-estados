defmodule Api.TownController do
    use Api.Web, :controller
    alias Api.State
    alias Api.Town

    def index(conn,  %{"state_id" => state_id} = params) do
        town = Repo.get!(State, state_id) |>  Repo.preload([:towns])
        render conn, "states.json", town: town
    end

    def index(conn, _params) do
        towns = Repo.all(Town) |> Repo.preload([:state])
        render conn, "index.json", towns: towns
    end

    def show(conn, %{"id" => town}) do
        town = Api.Repo.get!(Town, town) |> Repo.preload([:state])
        render conn, "show.json", town: town 
    end

end
