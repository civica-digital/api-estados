defmodule Api.ConstituencyControllerTest do
  use Api.ConnCase
  import Api.Factory 
  alias Api.Town
  alias Api.State

  test "#index renders a list of constituencies" do
    conn = build_conn()
    state = insert(:state)
    town = insert(:town)
    constituency = town |> Repo.preload([:constituencies])

    conn = get conn, state_town_constituency_path(conn, :index, state.id, town.id)

    assert json_response(conn, 200) == render_json( "states.json", constituency: constituency)
  end

  test "#show renders a single constituency" do
    conn = build_conn()
    state = insert(:state)
    town = insert(:town)
    constituency = insert(:constituency) |> Repo.preload([:town])

    conn = get conn, state_town_constituency_path(conn, :show, state.id, town.id, constituency.id)

    assert json_response(conn, 200) == render_json("show.json", constituency: constituency)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    Api.ConstituencyView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end