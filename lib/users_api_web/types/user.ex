defmodule UsersApiWeb.Types.User do
  use Absinthe.Schema.Notation

  @desc "Represents a user's contact preferences. Has fields: :likesEmails, :likesPhoneCalls"
  object :preferences do
    field :likes_emails, :boolean
    field :likes_phone_calls, :boolean
  end

  @desc "Represents a user of the system. Has fields: :id, :name, :email, :preferences"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :preferences, :preferences
  end
end
