defmodule Api.StateController do
    use Api.Web, :controller
    use PhoenixSwagger
    alias Api.State
    alias Api.QueryFilter

    swagger_path(:index) do   
      get "/api/v1/political_division/states"
      description "List of states"
      produces "application/json"
      response 200, "OK"
    end

    def index(conn, params) do
        states = 
          State
          |> QueryFilter.filter(%State{}, params, [:name, :short_name])
          |> Repo.all()

        render conn, "index.json", states: states
    end

    swagger_path(:show) do   
      get "/api/v1/political_division/states/{id}"
      description "Information of state"
      produces "application/json"
      parameter :id, :path, :integer, "state id", required: true, example: 1
      response 200, "OK"
    end
    
    def show(conn, %{"id" => state}) do
        state = Repo.get!(State, state)
        render conn, "show.json", state: state 
    end
    
end
