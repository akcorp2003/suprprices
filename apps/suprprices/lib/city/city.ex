defmodule Suprprices.City do
    use Ecto.Schema

    import Ecto.Changeset

    @derive {Poison.Encoder, only: [:id, :name, :state, :stores] }

    schema "cities" do
        field :name, :string
        field :state, :string

        has_many :stores, Suprprices.Store

        timestamps
    end

    @required_fields ~w(name state)a

    def changeset(city, params \\ %{}) do
        city
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        # |> validate_change
    end
end