defmodule Api.Town do
    use Api.Web, :model

    schema "towns" do
        field :name, :string
        field :state_id, :integer
        timestamps()
    end
end