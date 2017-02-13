defmodule Api.Repo.Migrations.CreateTableConstituency do
  use Ecto.Migration

  def up do
    create table(:constituencies) do
      add :section, :string, null: false
      add :town_id, references(:towns)
      timestamps()
    end

    create unique_index(:constituencies, [:section, :town_id])
  end

  def down do
    drop_if_exists table(:constituencies) 
  end
end
