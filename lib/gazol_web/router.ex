defmodule GazolWeb.Router do
  use GazolWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(GazolWeb.Plugs.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: GazolWeb.Schema)
  end
end
