defmodule Api.StateController do
    use Api.Web, :controller

    alias Api.State

    def index(conn, _params) do
        states = Repo.all(State) 
        render conn, "index.json", states: states
    end

    def show(conn, %{"id" => state}) do
        state = Repo.get!(State, state)
        render conn, "show.json", state: state 
    end
    
end
