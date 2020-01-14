defmodule GazolWeb.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  forward("/graphql",
    to: Absinthe.Plug,
    init_opts: [schema: GazolWeb.Schema]
  )

  if Mix.env() == :dev do
    forward("/graphiql",
      to: Absinthe.Plug.GraphiQL,
      init_opts: [
        schema: GazolWeb.Schema,
        interface: :simple
      ]
    )
  end
end
