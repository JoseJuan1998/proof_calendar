defmodule ProofCalendar.Repo.Migrations.CreateCalendar do
  use Ecto.Migration

  def change do
    create table(:calendars) do
      add :months, :json

      timestamps()
    end
  end
end
