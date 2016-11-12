defmodule Todolist.TodoItemTest do
  use Todolist.ModelCase

  alias Todolist.TodoItem

  @valid_attrs %{description: "some content", is_done: true, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TodoItem.changeset(%TodoItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TodoItem.changeset(%TodoItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
