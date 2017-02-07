defmodule Api.TownView do
    use Api.Web, :view

    alias Api.Repo

    def render("index.json", %{towns: towns}) do
        %{towns: render_many(towns, __MODULE__, "town.json")}
    end

    def render("town.json", %{town: town}) do
        %{
            id: town.id,
            state: Repo.get!(Api.State, town.state_id).name,
            name: town.name
        }
    end
end