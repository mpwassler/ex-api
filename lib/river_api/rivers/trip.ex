defmodule RiverApi.Rivers.Trip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trips" do
    field :title, :string
    field :description, :string
    field :date_of, :utc_datetime
    timestamps()
  end

  @doc false
  def changeset(trip, attrs) do
    trip
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
