defmodule Api.LocalityView do
    use Api.Web, :view

    alias Api.Repo

    def render("index.json", %{localities: localities}) do
        %{localities: render_many(localities, __MODULE__, "localities.json")}
    end

    def render("show.json", %{locality: locality}) do
         %{locality: render_one(locality, __MODULE__, "localities.json")}
    end

    def render("localities.json", %{locality: locality}) do
        %{
            id: locality.id,
            state: Repo.get!(Api.State, Repo.get!(Api.Town, locality.town_id).state_id).name,
            town:  Repo.get!(Api.Town, locality.town_id).name,
            name: locality.name,
            postcode: locality.postcode

        }
    end

    def render("states.json", %{locality: locality}) do
        %{state: render_one(locality, __MODULE__, "state.json")}
    end

    def render("state.json", %{locality: locality}) do
        %{
            name: Repo.get!(Api.State,locality.state_id).name,
            id: locality.state_id,
            town: render_one(locality, __MODULE__, "towns.json")
        }
    end

    def render("towns.json", %{locality: locality}) do
        %{
            id: locality.id,
            name: locality.name,
            localities: render_many(locality.localities, __MODULE__, "locality.json", as: :locality)
        }
    end

    def render("locality.json", %{locality: locality}) do
        %{
            id: locality.id,
            name: locality.name,
            postcode: locality.postcode
        }
    end
end