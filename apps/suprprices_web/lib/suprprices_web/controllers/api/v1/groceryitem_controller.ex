defmodule SuprpricesWeb.GroceryItemController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_groceries = Suprprices.GroceryQueries.get_all

        render(conn, "index.json", all_groceries: all_groceries)
    end

    def show(conn, %{"groceryitem" => groceryitem}) do
        grocery = Suprprices.GroceryQueries.get_grocery_by_name groceryitem

        render(conn, "index.json", all_groceries: grocery)
    end

    def create(conn, groceryitem) do
        case Suprprices.GroceryQueries.create groceryitem do
            {:ok, struct} -> json(conn, %{response: "ok", info: struct})
            {:error, info} -> json(conn, %{response: "error", info: info})
        end
    end

end