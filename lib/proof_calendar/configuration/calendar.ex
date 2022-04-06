defmodule ProofCalendar.Configuration.Calendar do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProofCalendar.Configuration.Calendar.Month

  schema "calendars" do
    embeds_many :months, Month

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [])
    |> cast_embed(:months)
    |> validate_required([:months])
  end

  def changeset() do
    %__MODULE__{}
    |> change(%{})
    |> setup_months()
    |> cast_embed(:months)
  end

  defp setup_months(changeset) do
    date = Date.utc_today

    calendar_params = %{
      "months" =>
        1..12
        |> Enum.map(fn x ->
          months(date.year, x)
        end)
      }

      %{changeset | params: calendar_params}
  end

  defp months(year, month) do
    days_per_month = Calendar.ISO.days_in_month(year, month)

    name_month =
      case month do
        1 -> "en"
        2 -> "fe"
        3 -> "ma"
        4 -> "ab"
        5 -> "my"
        6 -> "jn"
        7 ->  "jl"
        8 -> "ag"
        9 -> "se"
        10 -> "oc"
        11 -> "no"
        12 -> "di"
      end

    days_month =
      1..days_per_month
      |> Enum.reduce([], fn x, acc->

        new_date = Date.new!(year, month, x)

        cond do
          Date.day_of_week(new_date, :saturday) == 1 or Date.day_of_week(new_date, :sunday) == 1->
            list = [
              %{
              day: to_string(x),
              start: "00:00 am",
              end: "00:00 pm",
              is_off: true
            }
            ]
            list ++ acc
          true ->
            list = [
              %{
              day: to_string(x),
              start: "08:30 am",
              end: "06:00 pm",
              is_off: false
            }
            ]
            list ++ acc
        end
      end)

      %{
        name: name_month,
        week_days: "L-V",
        days: days_month
      }
  end
end
