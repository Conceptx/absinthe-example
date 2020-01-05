defmodule GazolWeb.Router do
  use GazolWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GazolWeb do
    pipe_through :api
  end
end
