defmodule Suprprices.CityQueries do
    import Ecto.Query

    alias Suprprices.{Repo, City}

    def get_all do
        Repo.all(from City)
    end

    def get_city_name(cityname) do
        Repo.get_by(City, name: cityname)
    end

    def get_city(current_city) do
        %Suprprices.City{name: name_of_city, state: statename} = current_city
        Repo.all from c in City,
                 where: c.name == ^name_of_city and c.state == ^statename,
                 preload: [:stores]

    end

    def create(city) do
        Repo.insert!(city)
    end
end

defmodule Suprprices.StoreQueries do
    import Ecto.Query
    require Suprprices.CityQueries
    import Suprprices.CityQueries

    alias Suprprices.{Repo, Groceryitem, Store, City}

    def get_store_by_address(address) do
        params = String.split(address, ",")
        streetname = String.trim(Enum.at(params, 0))
        cityname = String.trim(Enum.at(params, 1))
        state = String.trim(Enum.at(params, 2))

        Repo.all from s in Store,
                    where: s.street == ^streetname and s.cityname == ^cityname and s.state == ^state,
                    preload: [:groceryitems]
    end

    def create(store) do
        # %Store{name: store.name, description: store.description, street: storestreet, cityname: storecity, state: storestate, zipcode: store.zipcode}
        %City{name: store.cityname, state: store.state}
        |> get_city
        |> case do
            [] -> IO.puts "City does not exist"
            [city] ->
                city_changeset = City.changeset(city, %{name: city.name, state: city.state})
                store_changeset = Store.changeset(%Store{}, %{name: store.name, description: store.description, street: store.street, cityname: store.cityname, state: store.state, zipcode: store.zipcode})
                Ecto.Changeset.put_assoc(city_changeset, :stores, [store_changeset | city.stores])
            end
        |> Repo.update
    end
end



defmodule Suprprices.GroceryQueries do
    import Ecto.Query
    require Suprprices.StoreQueries
    require Suprprices.CityQueries

    import Suprprices.StoreQueries
    import Suprprices.CityQueries

    alias Suprprices.{Repo, Groceryitem, Store, City}

    def any do
        Repo.one(from gi in Groceryitem, select: count(gi.id)) != 0
    end

    def get_all do
        Repo.all from Groceryitem,
                    preload: [:store]
    end

    def get_all_from_store(storename) do
        query = from gi in Groceryitem,
                join: s in Store, where: s.id == gi.store_id and s.name == ^storename
        Repo.all(query)
    end

    def get_by_id(id) do
        Ecto.get(Groceryitem, id)
    end

    def create(grocery_item) do
        %{name: groceryname, description: grocerydescription, price: groceryprice, price_selling_by: grocerysellingby, store: value} = grocery_item
        %Suprprices.Store{name: storename, street: streetname, cityname: storecity, state: statename, zipcode: zip} = List.first value

        streetname
        |> Kernel.<>( ",")
        |> Kernel.<>(storecity)
        |> Kernel.<>( ",")
        |> Kernel.<>(statename)
        |> get_store_by_address
        |> case do
            [] ->
                IO.puts "hello no return"
                %Suprprices.City{name: storecity, state: statename}
                |> get_city
                |> case do
                    [] -> IO.puts "City does not exist"
                    [city] -> 
                        Suprprices.StoreQueries.create(List.first value)
                        __MODULE__.create(grocery_item)
                    end
                    
            [store] ->
                %City{name: storecity, state: statename}
                |> get_city
                |> case do
                    [] -> IO.puts "City does not exist"
                    [city] ->
                        store_changeset = Store.changeset(store, %{name: store.name, description: store.description, street: store.street, cityname: store.cityname, state: store.state, zipcode: store.zipcode})
                        
                        grocery_changeset = Groceryitem.changeset(%Groceryitem{}, %{name: groceryname, description: grocerydescription, price: groceryprice, price_selling_by: grocerysellingby})
                        
                        Ecto.Changeset.put_assoc(store_changeset, :groceryitems, [grocery_changeset | store.groceryitems])
                    end
                |> Repo.update
            
            end
    end
end