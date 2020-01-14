defmodule GazolWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias GazolWeb.Schema.{UserType, SessionType}

  import_types(UserType)
  import_types(SessionType)
end
