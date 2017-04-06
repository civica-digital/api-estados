defmodule Api.ErrorView do
  use Api.Web, :view

  def render("404.json", _assigns) do
    %{errors: %{detail: "Página no encontrada, para la documentación completa visita: /api/swagger/#/"}}
  end

  def render("500.json", _assigns) do
    %{errors: %{detail: "Error servidor interno, para la documentación completa visita: /api/swagger/#/"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.json", assigns
  end
end
