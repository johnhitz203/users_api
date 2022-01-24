defmodule UsersApiWeb.Router do
  use UsersApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/qraphql", Absinthe.Plug,
      schema: UsersApiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      interface: :playground,
      schema: UsersApiWeb.Schema,
      socket: UsersApiWeb.UserSocket
  end
end
