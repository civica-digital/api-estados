defmodule Api.StateController do
    use Api.Web, :controller

    alias Api.State

    def index(conn, _params) do
        states = Repo.all(State) |> Repo.preload([:towns]) |> Repo.preload([towns: [:constituencies]])
        render conn, "index.json", states: states
    end

    def show(conn, %{"id" => state}) do
        state = Api.Repo.get!(State, state) |> Repo.preload([:towns]) |> Repo.preload([towns: [:constituencies]])
        render conn, "show.json", state: state 
    end
end
