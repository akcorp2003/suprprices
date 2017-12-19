defmodule SuprpricesWeb.CityController do
    use SuprpricesWeb, :controller

    def index(conn, _params) do
        all_cities = Suprprices.CityQueries.get_all

        render(conn, "index.json", all_cities: all_cities)
    end

    def show(conn, %{"city" => city}) do
        city = Suprprices.CityQueries.get_city_name city

        render(conn, "index.json", all_cities: city)
    end
    
    # don't know why Phoenix appends an additional city to the path...
    def show(conn, %{"city_city" => city, "state" => state}) do
        IO.puts "here!"
        city = Suprprices.CityQueries.get_city_with_state(city, state)

        render(conn, "index.json", all_cities: city)
    end

    def create(conn, city) do
        case Suprprices.CityQueries.create city do
            {:ok, struct} -> json(conn, %{response: "ok"})
            {:error, info} -> json(conn, %{response: "error"})
        end
    end

end