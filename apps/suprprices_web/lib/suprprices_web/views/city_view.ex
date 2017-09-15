defmodule SuprpricesWeb.CityView do
    use SuprpricesWeb, :view

    def render("index.json", %{all_cities: all_cities}) do
        IO.inspect all_cities
        %{cities: all_cities}
    end
end