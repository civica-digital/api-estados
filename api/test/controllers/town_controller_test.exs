defmodule Api.TownControllerTest do
  use Api.ConnCase
  import Api.Factory 
  alias Api.Town
  alias Api.State

  test "#index renders a list of tonws" do
    conn = build_conn()
    state = insert(:state)
    insert(:town) 
    town = Repo.get(State, state.id) |>  Repo.preload(towns: from(c in Town, order_by: c.name))

    conn = get conn, state_town_path(conn, :index,state.id)

    assert json_response(conn, 200) == render_json( "states.json", town: town)
  end

  test "#show renders a single town" do
    conn = build_conn()
    state = insert(:state)
    town = insert(:town) |> Repo.preload([:state])

    conn = get conn, state_town_path(conn, :show, state.id, town.id)

    assert json_response(conn, 200) == render_json("show.json", town: town)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    Api.TownView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
