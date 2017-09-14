defmodule Suprprices.City do
    use Ecto.Schema

    import Ecto.Changeset
    import Suprprices.CityQueries

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

    defp city_must_not_already_exist(cityname) do
        get_city_name(cityname)
    end
end