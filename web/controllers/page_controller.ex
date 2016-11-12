defmodule Todolist.PageController do
  use Todolist.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def enter_todolist(conn, _params) do
    redirect conn, to: "/todolist"
  end
end
