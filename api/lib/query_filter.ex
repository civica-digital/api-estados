defmodule Api.QueryFilter do
  import Ecto.Query, only: [where: 2, order_by: 2, from: 2]

  def filter(query, model, params, filters) do
    where_clauses = cast(model, params, filters)

    query
    |> where(^where_clauses)
  end

  def cast(model, params, filters) do
    Ecto.Changeset.cast(model, params, [], filters)
    |> Map.fetch!(:changes)
    |> Map.to_list()
  end

  def order_by(model, values) do
    from(m in model, order_by: ^values)      
  end
end
