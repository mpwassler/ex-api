defmodule RiverApi.RiversTest do
  use RiverApi.DataCase

  alias RiverApi.Rivers

  describe "trips" do
    alias RiverApi.Rivers.Trip

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def trip_fixture(attrs \\ %{}) do
      {:ok, trip} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rivers.create_trip()

      trip
    end

    test "list_trips/0 returns all trips" do
      trip = trip_fixture()
      assert Rivers.list_trips() == [trip]
    end

    test "get_trip!/1 returns the trip with given id" do
      trip = trip_fixture()
      assert Rivers.get_trip!(trip.id) == trip
    end

    test "create_trip/1 with valid data creates a trip" do
      assert {:ok, %Trip{} = trip} = Rivers.create_trip(@valid_attrs)
    end

    test "create_trip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rivers.create_trip(@invalid_attrs)
    end

    test "update_trip/2 with valid data updates the trip" do
      trip = trip_fixture()
      assert {:ok, %Trip{} = trip} = Rivers.update_trip(trip, @update_attrs)
    end

    test "update_trip/2 with invalid data returns error changeset" do
      trip = trip_fixture()
      assert {:error, %Ecto.Changeset{}} = Rivers.update_trip(trip, @invalid_attrs)
      assert trip == Rivers.get_trip!(trip.id)
    end

    test "delete_trip/1 deletes the trip" do
      trip = trip_fixture()
      assert {:ok, %Trip{}} = Rivers.delete_trip(trip)
      assert_raise Ecto.NoResultsError, fn -> Rivers.get_trip!(trip.id) end
    end

    test "change_trip/1 returns a trip changeset" do
      trip = trip_fixture()
      assert %Ecto.Changeset{} = Rivers.change_trip(trip)
    end
  end
end
