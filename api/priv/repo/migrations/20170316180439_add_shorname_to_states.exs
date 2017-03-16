defmodule Api.Repo.Migrations.AddShornameToStates do
  use Ecto.Migration

  def change do
    alter table(:states) do
      add :short_name, :string
    end
  end
end
