defmodule Api.Router do
  use Api.Web, :router
  use PhoenixSwagger
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Api do
    pipe_through :api
    
    scope "/v1" do
      scope "/political_division" do
        resources "/states", StateController, only: [:index,:show] do
          resources "/towns", TownController, only: [:index,:show] do
            resources "/constituencies", ConstituencyController, only: [:index,:show]
          end
        end
      end
        #resources "/towns", TownController, only: [:index,:show]
        #resources "/constituencies", ConstituencyController, only: [:index,:show]
    end
  end
  
  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :api, swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      info: %{
        description: "Información geográfica de México (Estados, Municipios, Secciones electorales, Colonias, CPs, GeoJosns)",
        version: "0.1",
        title: "Api Estados",
        contact: %{
          name: "Cívica Digital ",
          url: "civica.digital",
          email: "hola@civica.digital"
        },
        license: %{
          name: "Apache 2.0",
          url: "http://www.apache.org/licenses/LICENSE-2.0.html"
        }
      },
      schemes: [
      "http"
      ],
      host: "localhost:4000"
    }
  end
end
#apiestados.opendev.mx