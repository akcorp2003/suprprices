defmodule Suprprices.Groceryitem do
    use Ecto.Schema

    import Ecto.Changeset

    @derive {Poison.Encoder, only: [:id, :name, :description, :price, :price_selling_by, :store] }

    schema "groceryitems" do
        field :name, :string
        field :description, :string
        field :price, :float
        field :price_selling_by, :string

        belongs_to :store, Suprprices.Store

        timestamps
    end

    @required_fields ~w(name price price_selling_by)a
    @optional_fields ~w(description)a

    def changeset(groceryitem, params \\ %{}) do
        groceryitem
        |> Suprprices.Repo.preload(:store)
        |> cast(params, @required_fields ++ @optional_fields)
        |> cast_assoc(:store)
    end
end