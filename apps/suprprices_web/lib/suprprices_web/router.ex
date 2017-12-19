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
      resources "/groceryitems", GroceryItemController, only: [:index, :create, :show], param: "groceryitem"

      # This path can be /stores/[blah]/city/[blah]/state/[blah]
      # OR
      # /stores/[blah]/state/[blah]
      # You can look up stores by city and state OR look up stores by state
      resources "/stores", StoreController, only: [:index, :create, :show], param: "store" do
        resources "/city", StoreController, only: [:index, :show], param: "city" do
          resources "/state", StoreController, only: [:index, :show], param: "state"
        end
        resources "state", StoreController, only: [:index, :show], param: "state"
      end

      # This path can be /stores/city/[blah]/state/[blah]
      # You can look up all stores in this city
      resources "/stores/city", StoreController, only: [:index, :show], param: "storecity" do
        resources "/state", StoreController, only: [:index, :show], param: "state"
      end

      resources "/cities", CityController, only: [:index, :create, :show], param: "city" do
        resources "/states", CityController, only: [:index, :show], param: "state"
      end
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
