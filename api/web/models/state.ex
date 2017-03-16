defmodule Api.State do
    use Api.Web, :model

    schema "states" do
        field :country, :string
        field :name, :string
        field :short_name, :string
        field :capital, :string
        field :geopoint, :string

        has_many :towns, Api.Town
        
        timestamps()
    end
end
