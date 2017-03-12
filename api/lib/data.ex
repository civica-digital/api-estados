defmodule Data do
    alias Api.State
    alias Api.Repo
    alias Api.Town

  def load_csv("estados") do


    File.stream!(Path.expand("priv/data/estados.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
      Repo.insert!(%State{name: row["estado"], capital: row["capital"]}) 
      end)
  end

  def load_csv("municipios") do

    File.stream!(Path.expand("priv/data/secciones_electorales.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
      state = Repo.get_by!(State, name: row["estado"])
      Repo.insert!(%Town{name: row["municipio"], state_id: state.id}) 
      end)
  end

  def load_csv("secciones") do
    File.stream!(Path.expand("priv/data/secciones_electorales.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
        town = Repo.get_by!(Town, name: row["municipio"], state_id: Repo.get_by!(State,name: row["estado"]).id)
        values_array = String.split(row["secciones_electorales"], ";")
        Enum.each(values_array, 
          fn(value) -> 
            Repo.insert!(%Api.Constituency{section: value, town_id: town.id}) 
        end)
      end)
  end
end
