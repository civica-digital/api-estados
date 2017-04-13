defmodule Api.Factory do
  use ExMachina.Ecto, repo: Api.Repo

  def state_factory do
    %Api.State{
        country: "Mexico",
        id: 1,
        name: "Ciudad de México",
        short_name: "CDMX",
        capital: "Cuauhtémoc",
        geopoint: "19.234432, -99.2345432"
    }
  end

  def town_factory do
    %Api.Town{
        state_id: 1,
        id: 1,
        name: "GAM"
    }
  end

  def constituency_factory do
    %Api.Constituency{
        town_id: 1,
        id: 1,
        section: "1"
    }
  end

end
