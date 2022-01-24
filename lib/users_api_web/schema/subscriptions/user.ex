defmodule UsersApiWeb.Schema.Subscriptions.User do
  use Absinthe.Schema.Notation

  object :user_subscriptions do
    field :user_created, :user do
      trigger :create_user, topic: fn _ ->
        "new_user"
      end

      config fn _,_ ->
        {:ok, topic: "new_user"}
      end
    end
  end
end
