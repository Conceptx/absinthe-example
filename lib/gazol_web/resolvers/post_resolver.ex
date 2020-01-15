defmodule GazolWeb.Resolvers.PostResolver do
  alias Gazol.Blog

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    Map.merge(input, %{user_id: current_user.id})
    |> Blog.create_post()
  end
end
