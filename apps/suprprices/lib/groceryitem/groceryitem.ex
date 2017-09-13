defmodule Suprprices.Groceryitem do
    use Ecto.Schema

    schema "groceryitems" do
        field :name, :string
        field :description, :string
        field :price, :float
        field :price_selling_by, :string

        belongs_to :store, Suprprices.Store

        timestamps
    end
end