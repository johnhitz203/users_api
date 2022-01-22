defmodule UsersApiWeb.Schema.Mutations.User do
  use Absinthe.Schema.Notation

  alias UsersApiWeb.Resolvers

  # @desc 
  object :user_mutations do
    field :update_user, :user do
      arg :id, non_null(:id)
      arg :name, :string
      arg :email, :string

      resolve &Resolvers.User.update/2
    end
  end
end
