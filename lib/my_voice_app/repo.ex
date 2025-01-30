defmodule MyVoiceApp.Repo do
  use Ecto.Repo,
    otp_app: :my_voice_app,
    adapter: Ecto.Adapters.Postgres
end
