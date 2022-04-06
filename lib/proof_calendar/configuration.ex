defmodule ProofCalendar.Configuration do
  import Ecto.Query, warn: false
  alias ProofCalendar.Repo
  alias ProofCalendar.Configuration.Calendar

  def create_calendar(attrs) do
    attrs
    |> Calendar.changeset()
    |> Repo.insert()
  end
end
