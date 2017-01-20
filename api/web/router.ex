defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Api do
    pipe_through :api


    scope "/v1" do
      resources "/states", StateController, only: [:index]
    end
  end
end
