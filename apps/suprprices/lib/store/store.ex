defmodule Suprprices.Store do
    use Ecto.Schema
    import Ecto.Changeset

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

    @required_fields ~w(name street cityname state zipcode)a
    @optional_fields ~w(description)

    def changeset(store, params \\ %{}) do
        store
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
    end
end