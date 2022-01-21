defmodule UsersApiWeb.Schema do
  use Absinthe.Schema

  import_types UsersApiWeb.Types.User
  import_types UsersApiWeb.Schema.Queries.User

  query do
    import_fields :users_queries
  end

end
