defmodule SuprpricesWeb.GroceryItemController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_groceries = Suprprices.GroceryQueries.get_all

        render(conn, "index.json", all_groceries: all_groceries)
    end

end