defmodule SuprpricesWeb.CityController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_cities = Suprprices.CityQueries.get_all

        render(conn, "index.json", all_cities: all_cities)
    end

end