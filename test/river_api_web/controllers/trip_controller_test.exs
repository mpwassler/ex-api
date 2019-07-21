defmodule RiverApiWeb.TripControllerTest do
  use RiverApiWeb.ConnCase

  alias RiverApi.Rivers
  alias RiverApi.Rivers.Trip

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:trip) do
    {:ok, trip} = Rivers.create_trip(@create_attrs)
    trip
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trips", %{conn: conn} do
      conn = get(conn, Routes.trip_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trip" do
    test "renders trip when data is valid", %{conn: conn} do
      conn = post(conn, Routes.trip_path(conn, :create), trip: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.trip_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.trip_path(conn, :create), trip: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trip" do
    setup [:create_trip]

    test "renders trip when data is valid", %{conn: conn, trip: %Trip{id: id} = trip} do
      conn = put(conn, Routes.trip_path(conn, :update, trip), trip: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.trip_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, trip: trip} do
      conn = put(conn, Routes.trip_path(conn, :update, trip), trip: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trip" do
    setup [:create_trip]

    test "deletes chosen trip", %{conn: conn, trip: trip} do
      conn = delete(conn, Routes.trip_path(conn, :delete, trip))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.trip_path(conn, :show, trip))
      end
    end
  end

  defp create_trip(_) do
    trip = fixture(:trip)
    {:ok, trip: trip}
  end
end
