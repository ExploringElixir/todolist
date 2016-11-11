defmodule Todolist.PageController do
  use Todolist.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
