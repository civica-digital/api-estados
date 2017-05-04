defmodule Data do
   #c "lib/data.ex"
    alias Api.State
    alias Api.Repo
    alias Api.Town

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
          if nombre_entidad == "Distrito Federal" do
            state = Repo.get_by(State, name: "Ciudad de México")
          else
            if nombre_entidad == "San Luis Potosi" do
              state = Repo.get_by(State, name: "San Luis Potosí")
            else
              if nombre_entidad == "Nuevo Leon" do
                state = Repo.get_by(State, name: "Nuevo León")
              else
                if nombre_entidad == "Yucatan" do
                  state = Repo.get_by(State, name: "Yucatán")
                else
                  if nombre_entidad == "Queretaro" do
                    state = Repo.get_by(State, name: "Querétaro de Arteaga")
                  else
                    if nombre_entidad == "Michoacan de Ocampo" do
                      state = Repo.get_by(State, name: "Michoacán de Ocampo")
                    else
                      if nombre_entidad == "Mexico" do
                        state = Repo.get_by(State, name: "Estado de México")
                      else
                        state = Repo.get_by(State, name: nombre_entidad)
                      end
                    end
                  end
                end
              end
            end
          end
          
           town = Repo.get_by(Town, name: locality_name, state_id: state.id)
           if town == nil do
            IO.puts locality_name
           end
           
        end
       #buscamos el municipio por name y le agregamos lat, long enb towns

       #buscamos id municipio(M) y id de locality(N) http://inegifacil.com/codes/m/n y guardamos en locality 
     end)
        
  end

end
