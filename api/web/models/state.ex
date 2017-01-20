defmodule Api.State do
    use Api.Web, :model

    schema "states" do
        field :name, :string

        timestamps()
    end
end