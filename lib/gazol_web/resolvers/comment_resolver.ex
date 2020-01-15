defmodule GazolWeb.Resolvers.CommentResolver do
  alias Gazol.Blog

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    Map.merge(input, %{user_id: current_user.id})
    |> Blog.create_comment()
  end
end
