defmodule Api.StateController do
    use Api.Web, :controller
    use PhoenixSwagger
    alias Api.State
    alias Api.QueryFilter

    swagger_path(:index) do   
      get "/api/v1/political_division/states"
      description "List of states"
      produces "application/json"
       parameters do
        name :path, :string, "nombre del estado", required: false, example: "Aguascalientes"
        short_name :path, :string, "nombre corto del estado", required: false, example: "Aguascalientes"
      end
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
        case state do
            nil ->
                conn
                |> put_status(400)
                |> render(Api.MessageView, "index.json", error: "Estado inválido")
            _ ->
              render conn, "show.json", state: state 
        end
    end
    
end
