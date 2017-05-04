defmodule Api.Repo.Migrations.CreateTableTowns do
  use Ecto.Migration

  def up do
    create table(:towns) do
      add :name, :string, null: false
      add :geopoint, :string, null: true
      add :state_id, references(:states)
      timestamps()
    end

    create unique_index(:towns, [:name, :state_id])
  end

  def down do
    drop_if_exists table(:towns) 
  end
end
