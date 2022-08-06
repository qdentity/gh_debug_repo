defmodule GhDebugWeb.PageController do
  use GhDebugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
