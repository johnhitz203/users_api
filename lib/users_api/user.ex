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

  def all(%{likes_emails: likes_emails, likes_phone_calls: likes_phone_calls}) do
    case Enum.filter(@users, &(&1.preferences === %{likes_emails: likes_emails, likes_phone_calls: likes_phone_calls})) do
      [] -> {:error, %{message: "not found", details: %{likes_emails: likes_emails, likes_phone_calls: likes_phone_calls}}}
      users -> {:ok, users}
    end
  end

  def all(_) do
    {:ok, @users}
  end
end