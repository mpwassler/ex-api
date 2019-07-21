defmodule RiverApiWeb.TripController do
  use RiverApiWeb, :controller

  alias RiverApi.Rivers
  alias RiverApi.Rivers.Trip

  action_fallback RiverApiWeb.FallbackController

  def index(conn, _params) do
    trips = Rivers.list_trips()
    render(conn, "index.json", trips: trips)
  end

  def create(conn, %{"trip" => trip_params}) do
    with {:ok, %Trip{} = trip} <- Rivers.create_trip(trip_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.trip_path(conn, :show, trip))
      |> render("show.json", trip: trip)
    end
  end

  def show(conn, %{"id" => id}) do
    trip = Rivers.get_trip!(id)
    render(conn, "show.json", trip: trip)
  end

  def update(conn, %{"id" => id, "trip" => trip_params}) do
    trip = Rivers.get_trip!(id)

    with {:ok, %Trip{} = trip} <- Rivers.update_trip(trip, trip_params) do
      render(conn, "show.json", trip: trip)
    end
  end

  def delete(conn, %{"id" => id}) do
    trip = Rivers.get_trip!(id)

    with {:ok, %Trip{}} <- Rivers.delete_trip(trip) do
      send_resp(conn, :no_content, "")
    end
  end
end
