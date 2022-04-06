defmodule ProofCalendar.Configuration do
  import Ecto.Query, warn: false
  alias ProofCalendar.Repo
  alias ProofCalendar.Configuration.Calendar

  def create_calendar() do
    Calendar.changeset()
    |> Repo.insert()
  end
end
