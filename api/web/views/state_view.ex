defmodule Api.StateView do
    use Api.Web, :view

    def render("index.json", %{states: states}) do
        %{states: render_many(states, __MODULE__, "state.json")}
    end

    def render("state.json", %{state: state}) do
        %{
            id: state.id,
            name: state.name,
            capital: state.capital,
            towns: render_many(state.towns, __MODULE__, "town.json", as: :town)
        }
    end

    def render("town.json", %{town: town}) do
        %{
            id: town.id,
            name: town.name
        }
    end
end
