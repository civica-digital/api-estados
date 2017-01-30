defmodule Api.TownView do
    use Api.Web, :view

    def render("index.json", %{towns: towns}) do
        %{towns: render_many(towns, __MODULE__, "town.json")}
    end

    def render("town.json", %{town: town}) do
        %{
            id: town.id,
            town: town.state_id,
            name: town.name
        }
    end
end