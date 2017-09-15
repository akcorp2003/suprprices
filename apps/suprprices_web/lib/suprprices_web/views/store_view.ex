defmodule SuprpricesWeb.StoreView do
    use SuprpricesWeb, :view

    def render("index.json", %{all_stores: all_stores}) do
        IO.inspect all_stores
        %{stores: all_stores}
    end
end