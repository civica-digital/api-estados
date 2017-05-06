defmodule Data do
   #c "lib/data.ex"
    alias Api.State
    alias Api.Repo
    alias Api.Town
    alias Api.Locality
    import Ecto.Query
    

  def load_csv("estados") do

    File.stream!(Path.expand("priv/data/estados.csv"))
    |> CSV.decode(separator: ?\,, headers: true)
    |> Enum.map(fn row ->
      Repo.insert!(%State{country: row["pais"], name: row["estado"], short_name: row["nombre_corto"], capital: row["capital"], geopoint: row["geopunto"]}) 
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

  def load_csv("colonias") do
    Enum.map(1..32, fn(x) -> 
        url_for(x) |> HTTPoison.get |> parse_response
    end)
  end

  defp url_for(id) do
    "http://inegifacil.com/cities/#{id}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> compute_data
  end

  defp parse_response(_) do
    :error
  end

   defp compute_data(json) do
     
     Enum.each(json, fn(map) -> 
       %{"clave_municipio" => locality_id, "nombre_municipio" => locality_name, "lat" => lat, "lng" => lng, "nombre_entidad"=> nombre_entidad } = map
       
       unless locality_name == "todo el estado" do
          case nombre_entidad do
            "Distrito Federal" ->
              state = Repo.get_by(State, name: "Ciudad de México")
            "San Luis Potosi" ->
              state = Repo.get_by(State, name: "San Luis Potosí")
            "Nuevo Leon" ->
              state = Repo.get_by(State, name: "Nuevo León")
            "Yucatan" ->
              state = Repo.get_by(State, name: "Yucatán")
            "Queretaro" ->
              state = Repo.get_by(State, name: "Querétaro de Arteaga")
            "Michoacan de Ocampo" ->
              state = Repo.get_by(State, name: "Michoacán de Ocampo")
            "Mexico" ->
              state = Repo.get_by(State, name: "Estado de México")
            _ ->
              state = Repo.get_by(State, name: nombre_entidad)
          end

          query = from t in Town, where: t.state_id == ^state.id
          town_state = Repo.all(query)

          Enum.each(town_state, 
            fn(value) -> 
              if removeAccent(value.name) == locality_name do
                town = Repo.get_by(Town, name: value.name, state_id: state.id) 
                post = Ecto.Changeset.change town, geopoint: "#{lat},#{lng}"
                case Repo.update post do
                  {:ok, struct}       -> 
                    create_locality(town.id, "http://inegifacil.com/codes/#{town.id}/#{locality_id}")
                  {:error, changeset} -> IO.puts "ERROR"
                end
                
              end
          end)
        end
     end) 
  end

  defp removeAccent(value) do
    value |> String.normalize(:nfd) |> String.replace(~r/[^A-Za-z\s]/u, "")
  end

  defp create_locality(town_id, url_for) do
   url_for |> HTTPoison.get |> parse_response_locality(town_id)
  end

  defp parse_response_locality({:ok, %HTTPoison.Response{body: body, status_code: 200}}, town_id) do
    body |> JSON.decode! |> insert_data(town_id)
  end

  defp parse_response_locality(_) do
    :error
  end

  defp insert_data(json, town_id) do
      Enum.each(json, 
        fn(map) -> 
          %{"tipo_asentamiento" => tipo_asentamiento,"nombre_asentamiento" => nombre_asentamiento, "codigo_postal_oficina" => codigo_postal_oficina } = map
          if Repo.get_by(Locality, name:  "#{nombre_asentamiento}", postcode: codigo_postal_oficina, town_id: town_id) == nil do    
            Repo.insert!(%Locality{name:  "#{nombre_asentamiento}", postcode: codigo_postal_oficina, town_id: town_id }) 
          end
      end) 
  end
  
end
