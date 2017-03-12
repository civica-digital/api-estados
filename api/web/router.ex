defmodule Api.Router do
  use Api.Web, :router
  
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
        resources "/towns", TownController, only: [:index,:show]
        resources "/constituencies", ConstituencyController, only: [:index,:show]
      end

    end
  end
end
