defmodule Api.State do
    use Api.Web, :model

    schema "states" do
        field :name, :string
        field :capital, :string

        has_many :towns, Api.Town
        
        timestamps()
    end
end
