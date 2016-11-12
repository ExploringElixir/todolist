defmodule Todolist.Repo.Migrations.CreateTodoItem do
  use Ecto.Migration

  def change do
    create table(:todoitem) do
      add :name, :string
      add :description, :text
      add :is_done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
