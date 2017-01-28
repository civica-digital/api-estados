defmodule Api.State do
    use Api.Web, :model

    schema "states" do
        field :name, :string
        field :capital, :string

        timestamps()
    end
end