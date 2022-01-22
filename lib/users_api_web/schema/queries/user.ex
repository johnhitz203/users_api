defmodule UsersApiWeb.Schema.Queries.User do
  use Absinthe.Schema.Notation

  alias UsersApiWeb.Resolvers

  object :users_queries do
    @desc """
    Returns a user or an error with an id: in the datails field and 'not found'
    in the message field if no user is found.

    Query with: /n
    query {
      user(id: id) {
        fields...
      }
    }
    """
    field :user, :user do
      arg :id, non_null(:id)

    resolve &Resolvers.User.find/2
    end

    @desc """
    Users returns a list of users or an empty list.
    Query with:

    query {
      users(likesEmails: boolean, likesPhoneCalls: boolean){
        fields
      }
    }
    """
    field :users, list_of(:user) do
      arg :likes_emails, :boolean
      arg :likes_phone_calls, :boolean

    resolve &Resolvers.User.all/2
    end
  end
end
