defmodule Api.ConstituencyView do
    use Api.Web, :view

    alias Api.Repo

    def render("index.json", %{constituencies: constituencies}) do
        %{constituencies: render_many(constituencies, __MODULE__, "constituencies.json")}
    end

    def render("show.json", %{constituency: constituency}) do
         %{constituency: render_one(constituency, __MODULE__, "constituencies.json")}
    end

    def render("constituencies.json", %{constituency: constituency}) do
        %{
            id: constituency.id,
            state: Repo.get!(Api.State, Repo.get!(Api.Town, constituency.town_id).state_id).name,
            town:  Repo.get!(Api.Town, constituency.town_id).name,
            section: constituency.section
        }
    end

    def render("states.json", %{constituency: constituency}) do
        %{state: render_one(constituency, __MODULE__, "state.json")}
    end

    def render("state.json", %{constituency: constituency}) do
        %{
            name: Repo.get!(Api.State,constituency.state_id).name,
            id: constituency.state_id,
            town: render_one(constituency, __MODULE__, "towns.json")
        }
    end

    def render("towns.json", %{constituency: constituency}) do
        %{
            id: constituency.id,
            name: constituency.name,
            constituencies: render_many(constituency.constituencies, __MODULE__, "constituency.json", as: :constituency)
        }
    end

    def render("constituency.json", %{constituency: constituency}) do
        %{
            id: constituency.id,
            section: constituency.section
        }
    end
end