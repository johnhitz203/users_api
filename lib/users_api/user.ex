defmodule UsersApi.User do
  @users [
    %{
      id: 1,
      name: "Bill",
      email: "bill@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: true
      }
    }, %{
      id: 2,
      name: "Alice",
      email: "alice@gmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: false
      }
    }, %{
      id: 3,
      name: "Jill",
      email: "jill@hotmail.com",
      preferences: %{
        likes_emails: true,
        likes_phone_calls: true
      }
    }, %{
      id: 4,
      name: "Tim",
      email: "tim@gmail.com",
      preferences: %{
        likes_emails: false,
        likes_phone_calls: false
      }
    }
  ]

  def find(%{id: id}) do
    case Enum.find(@users, &(&1.id === id)) do
      nil -> {:error, %{message: "not found", details: %{id: id}}}
      user -> {:ok, user}
    end
  end

  def all(args) do
    case Enum.filter(@users, &(Map.take(&1.preferences, Map.keys(args)) === args)) do
      [] -> {:error, %{message: "not found", details: args}}
      users -> {:ok, users}
    end
  end

  def update(id, params) do
    with {:ok, user} <- find(%{id: id}) do
      {:ok, Map.merge(user, params)}
    end
  end

  def update_user_preferences(id, params) do
    with {:ok, user} <- find(%{id: id}) do
      {:ok, %{id: 1, likes_emails: params.likes_emails, likes_phone_calls: params.likes_phone_calls}}
    end
  end
end
