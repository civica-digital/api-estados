defmodule Api.ErrorViewTest do
  use Api.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(Api.ErrorView, "404.json", []) ==
           %{errors: %{detail: "Página no encontrada, para la documentación completa visita: /api/swagger/#/"}}
  end

  test "render 500.json" do
    assert render(Api.ErrorView, "500.json", []) ==
           %{errors: %{detail: "Error servidor interno, para la documentación completa visita: /api/swagger/#/"}}
  end

  test "render any other" do
    assert render(Api.ErrorView, "505.json", []) ==
           %{errors: %{detail: "Error servidor interno, para la documentación completa visita: /api/swagger/#/"}}
  end
end
