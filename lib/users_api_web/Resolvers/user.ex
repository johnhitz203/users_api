defmodule UsersApiWeb.Resolvers.User do
  alias UsersApi.User

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    User.find(%{id: id})
  end

  def all(params, _) do
    User.all(params)
  end
end
