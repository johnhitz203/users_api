defmodule UsersApiWeb.Resolvers.User do
  alias UsersApi.User

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    User.find(%{id: id})
  end

  def all(params, _) do
    User.all(params)
  end

  def update(%{id: id} = params, _) do
    id = String.to_integer(id)

    User.update(id, Map.delete(params, id))
  end

  def update_user_preferences(%{user_id: id} = params, _) do
    id = String.to_integer(id)

    User.update_user_preferences(id, Map.delete(params, id))
  end

  def create(
    %{
      id: id,
      name: name,
      email: email,
      preferences: %{
        likes_emails: likes_emails,
        likes_phone_calls: likes_phone_calls
          }
        } = params, _) do
      {
        :ok,
        %{
          id: id,
          name: name,
          email: email,
          preferences: %{
            likes_emails: likes_emails,
            likes_phone_calls: likes_phone_calls
          }
        }
      }
  end
end
