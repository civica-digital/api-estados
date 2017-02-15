defmodule Api.ConstituencyView do
    use Api.Web, :view

    alias Api.Repo

    def render("index.json", %{constituencies: constituencies}) do
        %{constituencies: render_many(constituencies, __MODULE__, "constituency.json")}
    end

    def render("show.json", %{constituency: constituency}) do
         %{constituency: render_one(constituency, __MODULE__, "constituency.json")}
    end

    def render("constituency.json", %{constituency: constituency}) do
        %{
            id: constituency.id,
            state: Repo.get!(Api.State, Repo.get!(Api.Town, constituency.town_id).state_id).name,
            town:  Repo.get!(Api.Town, constituency.town_id).name,
            section: constituency.section
        }
    end
end
