defmodule Api.TownController do
    use Api.Web, :controller
    alias Api.State
    alias Api.Town
    alias Api.QueryFilter
    use PhoenixSwagger


    swagger_path(:index) do   
      get "/api/v1/political_division/states/{state_id}/towns"
      description "Lista de municipios de un estado"
      produces "application/json"
      parameter :state_id, :path, :integer, "state id", required: true, example: 1
      response 200, "OK"
    end
    def index(conn,  %{"state_id" => state_id} = params) do
        town = Repo.get(State, state_id) |>  Repo.preload([:towns])
        case town do
            nil ->
                conn
                |> put_status(400)
                |> render(Api.MessageView, "index.json", error: "Estado inválido")
            _ ->
                render conn, "states.json", town: town
        end
    end

   swagger_path(:show) do   
      get "/api/v1/political_division/states/{state_id}/towns/{id}"
      description "Información de un municipio"
      produces "application/json"
       parameters do
        state_id :path, :integer, "id del estado", required: true, example: 1
        id :path, :integer, "id del municipio", required: true, example: 1
      end
      response 200, "OK"
    end

    def show(conn, %{"state_id" => state, "id" => town}) do
        state_ = Repo.get(State, state)
        case state_ do
            nil ->
                conn
                |> put_status(400)
                |> render(Api.MessageView, "index.json", error: "Estado inválido")
            _ ->
                town_ = Repo.get(Town, town) |> Repo.preload([:state])
                case "#{state}" == "#{town_.state_id}" do
                    true ->
                        render conn, "show.json", town: town_
                    _ ->
                         conn
                        |> put_status(400)
                        |> render(Api.MessageView, "index.json", error: "Municipio no válido para el estado")
                end
        end
    end

end
