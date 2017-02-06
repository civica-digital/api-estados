defmodule Data do
  #Data.load_csv
  def load_csv do
    m = File.stream!(Path.expand("lib/estados.csv")) |> CSV.decode(separator: ?\t, headers: true) 
    Enum.map(m, 
        fn(x) -> 
           x
    end) 
  end
end
