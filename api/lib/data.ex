defmodule Data do
  
  def load_csv do
    File.stream!(Path.expand("lib/estados.csv")) |>
    CSV.decode(separator: ?\t) |>
    Enum.map(fn row ->
        Enum.map(row, &String.upcase/1)
    end)
  end
end
