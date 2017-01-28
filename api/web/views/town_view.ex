defmodule Api.TownView do
    use Api.Web, :view

    def render("index.json", %{towns: towns}) do
        %{towns: render_many(towns, __MODULE__, "state.json")}
    end

    def render("town.json", %{town: town}) do
        %{
            id: town.id,
            name: town.name
        }
    end
end