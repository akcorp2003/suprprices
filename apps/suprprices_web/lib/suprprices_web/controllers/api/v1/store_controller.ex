defmodule SuprpricesWeb.StoreController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_stores = Suprprices.StoreQueries.get_all

        render(conn, "index.json", all_stores: all_stores)
    end
end