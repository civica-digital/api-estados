 defmodule Api.ConstituencyViewTest do 
  use Api.ModelCase
  import Api.Factory
  alias Api.ConstituencyView
  alias Api.Town
  alias Api.State
  alias Api.Constituency

  test "constituency_json" do
    state = insert(:state)
    town = insert(:town)
    constituency = insert(:constituency)

    rendered_constituency = ConstituencyView.render("constituency.json", %{constituency: constituency})

    assert rendered_constituency == %{
        id: constituency.id,
        section: constituency.section
    }
  end

  test "index.json" do
    state = insert(:state)
    town = insert(:town)
    constituency = town |> Repo.preload([:constituencies])

    rendered_constituency = ConstituencyView.render("states.json", constituency: constituency)

    assert rendered_constituency == %{
      state: ConstituencyView.render("state.json", constituency: constituency)
    }
  end

  test "show.json" do
    state = insert(:state)
    town = insert(:town)
    constituency = insert(:constituency) |> Repo.preload([:town])
    
    rendered_constituency = ConstituencyView.render("show.json", constituency: constituency)

    assert rendered_constituency == %{
      constituency: ConstituencyView.render("constituencies.json", %{constituency: constituency})
    }
  end

end