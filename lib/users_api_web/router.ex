defmodule UsersApiWeb.Router do
  use UsersApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/qraphql", Absinthe.Plug.Graphql,
      schema: UsersApiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: UsersApiWeb.Schema
  end
end