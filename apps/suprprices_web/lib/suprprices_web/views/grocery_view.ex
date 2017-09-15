defmodule SuprpricesWeb.GroceryItemView do
    use SuprpricesWeb, :view

    def render("index.json", %{all_groceries: all_groceries}) do
        IO.inspect all_groceries
        %{groceries: all_groceries}
    end
end