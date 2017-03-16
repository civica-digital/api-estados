defmodule Api.QueryFilter do
  def filter(query, model, params, filters) do
    import Ecto.Query, only: [where: 2]

    where_clauses = cast(model, params, filters)

    query
    |> where(^where_clauses)
  end

  def cast(model, params, filters) do
    Ecto.Changeset.cast(model, params, [], filters)
    |> Map.fetch!(:changes)
    |> Map.to_list()
  end
end
