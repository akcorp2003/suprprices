defmodule Suprprices.City do
    use Ecto.Schema

    schema "cities" do
        field :name, :string
        field :state, :string

        has_many :stores, Suprprices.Store

        timestamps
    end
end