defmodule Api.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:states, [:name])
  end
end
