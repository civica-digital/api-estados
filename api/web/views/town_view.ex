defmodule Api.TownView do
    use Api.Web, :view

    def render("index.json", %{towns: towns}) do
        %{towns: render_many(towns, __MODULE__, "towns.json")}
    end

    def render("show.json", %{town: town}) do
         %{town: render_one(town, __MODULE__, "towns.json")}
    end    

    def render("states.json", %{town: town}) do
         %{state: render_one(town, __MODULE__, "state.json")}
    end

    def render("state.json", %{town: town}) do
        %{
            id: town.id,
            name: town.name,
            towns: render_many(town.towns, __MODULE__, "town.json", as: :town)
        }
    end

    def render("towns.json", %{town: town}) do
        %{
            id: town.id,
            name: town.name,
            state: Api.Repo.get!(Api.State, town.state_id).name
        }
    end

     def render("town.json", %{town: town}) do
        %{
            id: town.id,
            name: town.name
        }
    end
end
