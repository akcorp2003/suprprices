defmodule Suprprices.Store do
    use Ecto.Schema

    schema "stores" do
        field :name, :string
        field :description, :string
        field :street, :string
        field :cityname, :string
        field :state, :string
        field :zipcode, :string

        has_many :groceryitems, Suprprices.Groceryitem

        belongs_to :city, Suprprices.City

        timestamps
    end
end