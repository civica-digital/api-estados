defmodule Api.StateController do
    use Api.Web, :controller

    alias Api.State

    def index(conn, _params) do
        states = Repo.all(State) |> Repo.preload([:towns])
        render conn, "index.json", states: states
    end
end
