defmodule Suprprices.Groceryitem do
    use Ecto.Schema

    import Ecto.Changeset

    schema "groceryitems" do
        field :name, :string
        field :description, :string
        field :price, :float
        field :price_selling_by, :string

        belongs_to :store, Suprprices.Store

        timestamps
    end

    @required_fields ~w(name price price_selling_by store)a
    @optional_fields ~w(description)a

    def changeset(groceryitem, params \\ %{}) do
        groceryitem
        |> cast(params, @required_fields ++ @optional_fields)
    end
end