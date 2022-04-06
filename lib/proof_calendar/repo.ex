defmodule ProofCalendar.Repo do
  use Ecto.Repo,
    otp_app: :proof_calendar,
    adapter: Ecto.Adapters.Postgres
end
