defmodule RiverApiWeb.PageController do
  use RiverApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
