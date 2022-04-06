defmodule ProofCalendar.Configuration.Calendar.Day do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :day, :string
    field :start, :string
    field :end, :string
    field :is_off, :boolean
  end

  @type t :: %__MODULE__{
    day: String.t(),
    start: String.t(),
    end: String.t(),
    is_off: Boolean.t()
  }

  def changeset(day, attrs) do
    day
    |> cast(attrs, [:day, :start, :end, :is_off])
    |> validate_required([:day, :start, :end, :is_off])
  end
end
