defmodule ProofCalendar.Configuration.Calendar.Month do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProofCalendar.Configuration.Calendar.Day

  embedded_schema do
    field :name, :string
    embeds_many :days, Day
    field :week_days, :string
  end

  @type t :: %__MODULE__{
    days: Day.t(),
    week_days: String.t()
  }

  def changeset(month, attrs) do
    month
    |> cast(attrs, [:name, :week_days])
    |> cast_embed(:days)
    |> validate_required([:days, :week_days])
  end
end
