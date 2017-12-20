defmodule SuprpricesWeb.StoreController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_stores = Suprprices.StoreQueries.get_all

        render(conn, "index.json", all_stores: all_stores)
    end

    def show(conn, %{"store" => storename}) do

        all_stores_with_name = Suprprices.StoreQueries.get_store_by_name( String.replace(storename, "+", " ") )

        render(conn, "index.json", all_stores: all_stores_with_name)
    end

    def show(conn, %{"store_store" => storename, "store_city" => city, "state" => state}) do
        all_stores_in_city_with_name = Suprprices.StoreQueries.get_store_by_city_state String.replace(storename, "+", " "), city, state

        render(conn, "index.json", all_stores: all_stores_in_city_with_name)
    end

    def show(conn, %{"store_storecity" => city, "state" => state}) do
        all_stores_in_city_with_name = Suprprices.StoreQueries.get_store_by_city_state city, state

        render(conn, "index.json", all_stores: all_stores_in_city_with_name)
    end

    def show(conn, %{"store_store" => storename, "state" => state}) do
        all_stores_in_state_with_name = Suprprices.StoreQueries.get_store_by_state String.replace(storename, "+", " "), state

        render(conn, "index.json", all_stores: all_stores_in_state_with_name)
    end

    def create(conn, store) do
        case Suprprices.StoreQueries.create store do
            {:ok, struct} -> json(conn, %{response: "ok", info: "ok"})
            {:error, info} -> json(conn, %{response: "error", info: info})
        end
    end
end