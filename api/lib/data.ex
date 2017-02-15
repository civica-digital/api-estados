defmodule Data do

  def load_csv("estados") do
    alias Api.State

    File.stream!(Path.expand("priv/data/estados.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
      Api.Repo.insert!(%Api.State{name: row["estado"], capital: row["capital"]}) 
      end)
  end

  def load_csv("municipios") do
    alias Api.State

    File.stream!(Path.expand("priv/data/secciones_electorales.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
      state = Api.Repo.get_by!(Api.State, name: row["estado"])
      Api.Repo.insert!(%Api.Town{name: row["municipio"], state_id: state.id}) 
      end)
  end

  def load_csv("secciones") do
    alias Api.State
    File.stream!(Path.expand("priv/data/secciones_electorales.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
        town = Api.Repo.get_by!(Api.Town, name: row["municipio"], state_id: Api.Repo.get_by!(Api.State,name: row["estado"]).id)
        values_array = String.split(row["secciones_electorales"], ";")
        Enum.each(values_array, 
          fn(value) -> 
            Api.Repo.insert!(%Api.Constituency{section: value, town_id: town.id}) 
        end)
      end)
  end
end
