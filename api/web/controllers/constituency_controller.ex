defmodule Api.ConstituencyController do
     use Api.Web, :controller

    alias Api.Constituency
    alias Api.State
    alias Api.Town

    def index(conn,  %{"state_id" => state_id, "town_id" => town_id} = params) do
        constituency = Repo.get!(Town, town_id)  |> Repo.preload([:constituencies])
        render conn, "states.json", constituency: constituency
    end

    def index(conn, _params) do
        constituencies = Repo.all(Constituency) |> Repo.preload([:town])
        render conn, "index.json", constituencies: constituencies
    end

    def show(conn, %{"id" => constituency}) do
        constituency = Api.Repo.get!(Constituency, constituency) |> Repo.preload([:town])
        render conn, "show.json", constituency: constituency 
    end
end