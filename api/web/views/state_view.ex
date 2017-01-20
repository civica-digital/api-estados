defmodule Api.StateView do
    use Api.Web, :view

    def render("index.json", %{states: states}) do
        %{states: render_many(states, __MODULE__, "state.json")}
    end

    def render("state.json", %{state: state}) do
        %{
            id: state.id,
            name: state.name
        }
    end
end