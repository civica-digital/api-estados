defmodule Data do
  #Data.load_csv
  def load_csv(csv_mame) do
    alias Api.State

    File.stream!(Path.expand("lib/data/#{csv_mame}.csv")) 
    |> CSV.decode(separator: ?\t) 
    |> Enum.map(fn row ->
          values = String.split("#{row}",",")
          Enum.each(values, fn(s) -> 
            IO.puts(s) 
            #Api.Repo.insert!(%Api.State{name: "Aguascalientes", capital: "Aguascalientes"})
          end)
          IO.puts "*************"
        end)
  end
end
