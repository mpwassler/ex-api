defmodule RiverApiWeb.Router do
  use RiverApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RiverApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
  

  scope "/v1" do
    pipe_through :api
    resources "/trip", RiverApiWeb.TripController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RiverApiWeb do
  #   pipe_through :api
  # end
end
