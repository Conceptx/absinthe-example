defmodule Gazol.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Gazol.Accounts.User
  alias Gazol.Blog.Post

  schema "comments" do
    field(:context, :string)
    belongs_to(:user, User)
    belongs_to(:post, Post)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:context, :user_id, :post_id])
    |> validate_required([:context, :user_id, :post_id])
  end
end
