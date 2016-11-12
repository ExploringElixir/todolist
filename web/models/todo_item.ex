defmodule Todolist.TodoItem do
  use Todolist.Web, :model

  schema "todoitem" do
    field :name, :string
    field :description, :string
    field :is_done, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :is_done])
    |> validate_required([:name, :description, :is_done])
  end
end
