defmodule GazolWeb.Schema.CommentType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Gazol.Repo

  object :comment_type do
    field(:id, :id)
    field(:context, :string)
    field(:user, :user_type, resolve: assoc(:user))
    field(:post, :post_type, resolve: assoc(:post))
  end

  input_object :comment_input_type do
    field(:context, non_null(:string))
    field(:post_id, non_null(:id))
  end
end
