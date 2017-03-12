defmodule Api.StateView do
    use Api.Web, :view

    def render("index.json", %{states: states}) do
        %{states: render_many(states, __MODULE__, "state.json")}
    end

    def render("show.json", %{state: state}) do
         %{state: render_one(state, __MODULE__, "state.json")}
    end

    def render("state.json", %{state: state}) do
        %{
            country: state.country,
            id: state.id,
            name: state.name,
            capital: state.capital,
            geopoint: state.geopoint
        }
    end
end
