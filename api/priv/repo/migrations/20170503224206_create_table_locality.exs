defmodule Api.Repo.Migrations.CreateTableLocality do
  use Ecto.Migration

  def up do
    create table(:localities) do
      add :name, :string, null: false
      add :postcode, :string, null: false
      add :town_id, references(:towns)
      timestamps()
    end

    create unique_index(:localities, [:name, :town_id])
  end

  def down do
    drop_if_exists table(:localities) 
  end
end
