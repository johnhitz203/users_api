defmodule UsersApiWeb.Schema.Mutations.User do
  use Absinthe.Schema.Notation

  alias UsersApiWeb.Resolvers

  object :user_mutations do
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :name, :string
      arg :email, :string

      resolve &Resolvers.User.update/2
    end

    field :update_user_preferences, :preferences do
      arg :user_id, non_null(:id)
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean

      resolve &Resolvers.User.update_user_preferences/2
    end

    field :create_user, :user do
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :email, non_null(:string)

      arg :preferences, non_null(:preferences_input)

      resolve &Resolvers.User.create/2
    end
  end
end
