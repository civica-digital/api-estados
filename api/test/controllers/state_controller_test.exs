defmodule Api.StateControllerTest do
  use Api.ConnCase
  import Api.Factory 

  test "#index renders a list of states" do
    conn = build_conn()
    state = insert(:state)

    conn = get conn, state_path(conn, :index)

    assert json_response(conn, 200) == render_json("index.json", states: [state])
  end

  test "#show renders a single state" do
    conn = build_conn()
    state = insert(:state)

    conn = get conn, state_path(conn, :show, state.id)

    assert json_response(conn, 200) == render_json("show.json", state: state)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    Api.StateView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
