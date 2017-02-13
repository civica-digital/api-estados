defmodule Api.Constituency do
    use Api.Web, :model

    schema "constituencies" do
      field :section, :string
      belongs_to :town, Api.Constituency, foreign_key: :town_id 
      
      timestamps()
    end
end
