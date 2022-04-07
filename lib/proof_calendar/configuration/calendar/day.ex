defmodule ProofCalendar.Configuration.Calendar.Day do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :day_number, :string
    field :start, :string
    field :end, :string
    field :is_off, :boolean
  end

  @type t :: %__MODULE__{
    day_number: String.t(),
    start: String.t(),
    end: String.t(),
    is_off: Boolean.t()
  }

  def changeset(day, attrs) do
    day
    |> cast(attrs, [:day_number, :start, :end, :is_off])
    |> validate_required([:day_number, :start, :end, :is_off])
  end
end
