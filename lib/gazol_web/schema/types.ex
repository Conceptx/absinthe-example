defmodule GazolWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias GazolWeb.Schema.UserType

  import_types(UserType)
end
