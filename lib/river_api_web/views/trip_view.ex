defmodule RiverApiWeb.TripView do
  use RiverApiWeb, :view
  alias RiverApiWeb.TripView

  def render("index.json", %{trips: trips}) do
    %{data: render_many(trips, TripView, "trip.json")}
  end

  def render("show.json", %{trip: trip}) do
    %{data: render_one(trip, TripView, "trip.json")}
  end

  def render("trip.json", %{trip: trip}) do
    IO.inspect(trip)
    %{
      id: trip.id,
      title: trip.title,
      description: trip.description
    }
  end
end
