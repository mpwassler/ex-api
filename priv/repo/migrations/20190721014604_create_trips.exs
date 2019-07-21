defmodule RiverApi.Repo.Migrations.CreateTrips do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :title, :string	  	  		
	  add :description, :text	  
	  add :date_of, :utc_datetime	  
      timestamps()
    end

  end
end
