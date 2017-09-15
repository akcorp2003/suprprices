defmodule SuprpricesWeb.Router do
  use SuprpricesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SuprpricesWeb do
    pipe_through :api

    scope "/v1" do
      post "/groceryitems", GroceryItemController, :create
    end
  end

  scope "/", SuprpricesWeb do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SuprpricesWeb do
  #   pipe_through :api
  # end
end
