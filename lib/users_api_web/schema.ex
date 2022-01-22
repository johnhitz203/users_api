defmodule UsersApiWeb.Schema do
  use Absinthe.Schema

  import_types UsersApiWeb.Types.User
  import_types UsersApiWeb.Schema.Queries.User
  import_types UsersApiWeb.Schema.Mutations.User

  query do
    import_fields :users_queries
  end

  mutation do
    import_fields :user_mutations
  end

end
