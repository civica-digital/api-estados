 defmodule Api.TownViewTest do 
  use Api.ModelCase
  import Api.Factory
  alias Api.TownView
  alias Api.Town
  alias Api.State

  test "town_json" do
    state = insert(:state)
    town = insert(:town)

    rendered_town = TownView.render("town.json", %{town: town})

    assert rendered_town == %{
        id: town.id,
        name: town.name
    }
  end

  test "index.json" do
    state = insert(:state)
    insert(:town)
    town = Repo.get(State, state.id) |>  Repo.preload(towns: from(c in Town, order_by: c.name))

    rendered_towns = TownView.render("states.json", town: town)

    assert rendered_towns == %{
      state: TownView.render("state.json", town: town)
    }
  end

  test "show.json" do
    state = insert(:state)
    town = insert(:town) |> Repo.preload([:state])

    rendered_state = TownView.render("show.json", %{town: town})

    assert rendered_state == %{
      town: TownView.render("towns.json", %{town: town})
    }
  end
end