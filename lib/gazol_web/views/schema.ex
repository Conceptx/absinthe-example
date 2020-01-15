defmodule GazolWeb.Schema do
  use Absinthe.Schema

  alias GazolWeb.Resolvers
  alias GazolWeb.Schema.Middleware

  # import Types
  import_types(GazolWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      # Resolver
      middleware(Middleware.Authorize, "user")
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Login a user and return a JWT token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_user/3)
    end

    @desc "Create a post"
    field :create_post, type: :post_type do
      arg(:input, non_null(:post_input_type))
      middleware(Middleware.Authorize, "user")
      resolve(&Resolvers.PostResolver.create_post/3)
    end

    @desc "Create a comment"
    field :create_comment, type: :comment_type do
      arg(:input, non_null(:comment_input_type))
      middleware(Middleware.Authorize, "user")
      resolve(&Resolvers.CommentResolver.create_comment/3)
    end
  end
end
