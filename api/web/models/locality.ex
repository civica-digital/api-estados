defmodule Api.Locality do
    use Api.Web, :model

    schema "locality" do
      field :name, :string
      field :postcode, :string
    
      belongs_to :town, Api.Locality, foreign_key: :town_id 
      
      timestamps()
    end
end
