defmodule Todolist.TodoItemController do
  use Todolist.Web, :controller

  alias Todolist.TodoItem

  def index(conn, _params) do
    todoitem = Repo.all(TodoItem)
    render(conn, "index.html", todoitem: todoitem)
  end

  def new(conn, _params) do
    changeset = TodoItem.changeset(%TodoItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo_item" => todo_item_params}) do
    changeset = TodoItem.changeset(%TodoItem{}, todo_item_params)

    case Repo.insert(changeset) do
      {:ok, _todo_item} ->
        conn
        |> put_flash(:info, "Todo item created successfully.")
        |> redirect(to: todo_item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_item = Repo.get!(TodoItem, id)
    render(conn, "show.html", todo_item: todo_item)
  end

  def edit(conn, %{"id" => id}) do
    todo_item = Repo.get!(TodoItem, id)
    changeset = TodoItem.changeset(todo_item)
    render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo_item" => todo_item_params}) do
    todo_item = Repo.get!(TodoItem, id)
    changeset = TodoItem.changeset(todo_item, todo_item_params)

    case Repo.update(changeset) do
      {:ok, todo_item} ->
        conn
        |> put_flash(:info, "Todo item updated successfully.")
        |> redirect(to: todo_item_path(conn, :show, todo_item))
      {:error, changeset} ->
        render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_item = Repo.get!(TodoItem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(todo_item)

    conn
    |> put_flash(:info, "Todo item deleted successfully.")
    |> redirect(to: todo_item_path(conn, :index))
  end
end
