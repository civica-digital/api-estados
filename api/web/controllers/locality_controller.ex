defmodule Api.LocalityController do
    use Api.Web, :controller
    alias Api.Locality
    alias Api.State
    alias Api.Town
    use PhoenixSwagger

    swagger_path(:index) do   
      get "/api/v1/political_division/states/{state_id}/towns/{town_id}/localities"
      description "Lista de colonias y códigos postales de un estado"
      produces "application/json"
       parameters do
        state_id :path, :integer, "id del estado", required: true, example: 1
        town_id :path, :integer, "id del municipio", required: true, example: 1
      end
      response 200, "OK"
    end
    def index(conn,  %{"state_id" => state, "town_id" => town}) do
        state_ = Repo.get(State, state)
        case state_ do
            nil ->
                conn
                |> put_status(400)
                |> render(Api.MessageView, "index.json", error: "Estado inválido")
            _ ->
                locality = Repo.get(Town, town) |> Repo.preload([:constituencies])
                case "#{state}" == "#{locality.state_id}" do
                    true ->
                       render conn, "states.json", locality: locality
                    _ ->
                         conn
                        |> put_status(400)
                        |> render(Api.MessageView, "index.json", error: "Municipio no válido para el estado")
                end
        end
        
    end

    swagger_path(:show) do   
      get "/api/v1/political_division/states/{state_id}/towns/{town_id}/localities/{id}"
      description "Información de una colonia"
      produces "application/json"
       parameters do
        state_id :path, :integer, "id del estado", required: true, example: 1
        town_id :path, :integer, "id del municipio", required: true, example: 1
        id :path, :integer, "id de la colonia", required: true, example: 1
      end
      response 200, "OK"
    end
    def show(conn, %{"state_id" => state, "town_id" => town, "id" => locality}) do
        state_ = Repo.get(State, state)
        case state_ do
            nil ->
                conn
                |> put_status(400)
                |> render(Api.MessageView, "index.json", error: "Estado inválido")
            _ ->
               town_ = Repo.get(Town, town)
               case "#{state}" == "#{town_.state_id}" do
                    true ->
                       locality = Repo.get(Locality, locality) |> Repo.preload([:town])
                       case "#{town}" == "#{locality.town_id}" do
                           true ->
                               render conn, "show.json", locality: locality 
                          _ ->
                            conn
                               |> put_status(400)
                               |> render(Api.MessageView, "index.json", error: "Colonia no válida para el municipio")
                        end
                    _ ->
                         conn
                        |> put_status(400)
                        |> render(Api.MessageView, "index.json", error: "Municipio no válido para el estado")
                end
        end
        
        
    end
end