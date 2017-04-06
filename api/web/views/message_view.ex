defmodule Api.MessageView do
  use Api.Web, :view

  def render("index.json", %{error: error}) do
    %{error: %{
        title: "Api estados",
        error: error,
        message: "Para la documentación completa visita: /api/swagger/#/"
      } 
    }
  end
  
end
