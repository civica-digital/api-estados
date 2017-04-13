defmodule Api.StateViewTest do
  use Api.ModelCase
  import Api.Factory
  alias Api.StateView

  test "state_json" do
    state = insert(:state)

    rendered_state = StateView.render("state.json", %{state: state})

    assert rendered_state == %{
        country: state.country,
        id: state.id,
        name: state.name,
        short_name: state.short_name,
        capital: state.capital,
        geopoint: state.geopoint
    }
  end

  test "index.json" do
    state = insert(:state)

    rendered_states = StateView.render("index.json", %{states: [state]})

    assert rendered_states == %{
      states: [StateView.render("state.json", %{state: state})]
    }
  end

  test "show.json" do
    state = insert(:state)

    rendered_state = StateView.render("show.json", %{state: state})

    assert rendered_state == %{
      state: StateView.render("state.json", %{state: state})
    }
  end
end
