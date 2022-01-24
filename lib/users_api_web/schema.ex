defmodule UsersApiWeb.Schema do
  use Absinthe.Schema

  import_types UsersApiWeb.Types.User
  import_types UsersApiWeb.Schema.Queries.User
  import_types UsersApiWeb.Schema.Mutations.User
  import_types UsersApiWeb.Schema.Subscriptions.User

  query do
    import_fields :users_queries
  end

  mutation do
    import_fields :user_mutations
  end

  subscription do
    import_fields :user_subscriptions
  end

  # subscription do
  #   field :user_created, :user do
  #     trigger :create_user, topic: fn _ ->
  #       "new_user"
  #     end
  #
  #     config fn _, _ ->
  #       {:ok, topic: "new_user"}
  #     end
  #   end
  # end
end
