defmodule Api.StateController do
    use Api.Web, :controller

    alias Api.State
    alias Api.QueryFilter

    def index(conn, params) do
        states = 
          State
          |> QueryFilter.filter(%State{}, params, [:name, :short_name])
          |> Repo.all()

        render conn, "index.json", states: states
    end

    def show(conn, %{"id" => state}) do
        state = Repo.get!(State, state)
        render conn, "show.json", state: state 
    end
    
end
