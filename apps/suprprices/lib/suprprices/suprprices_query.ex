defmodule Suprprices.CityQueries do
    import Ecto.Query

    alias Suprprices.{Repo, City, Store}

    def get_all do
        stores = from s in Store,
            select: [s.id, s.name, s.description, s.cityname, s.state, s.zipcode]
        Repo.all(from City, preload: [stores: ^stores])
    end

    def get_city_name(cityname) do
        stores = from s in Store,
            select: [s.id, s.name, s.description, s.cityname, s.state, s.zipcode]

        Repo.all from c in City,
                    where: c.name == ^cityname,
                    preload: [stores: ^stores]
    end

    def get_city_with_state(city, state) do
        stores = from s in Store,
            select: [s.id, s.name, s.description, s.cityname, s.state, s.zipcode]

        Repo.all from c in City,
                    where: c.name == ^city and c.state == ^state,
                    preload: [stores: ^stores]
    end

    def get_city(current_city) do
        %Suprprices.City{name: name_of_city, state: statename} = current_city
        Repo.all from c in City,
                 where: c.name == ^name_of_city and c.state == ^statename,
                 preload: [:stores]

    end

    def create(city) do
        %{"name" => cityname, "state" => statename} = city

        get_city_with_state(cityname, statename)
        |> case do
            [] -> 
                Repo.insert %City{name: cityname, state: statename}
            [city] -> 
                {:error, "A city with the same name and state already exists."}
            _ ->
                {:error, "Something went wrong in the backend."}
            end 
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

    def get_store_by_name(name) do
        query = from s in Store,
                select: [s.name, s.description, s.street, s.cityname, s.state, s.zipcode],
                where: s.name == ^name
        Repo.all query
    end

    def get_store_by_city_state(city, state) do
        query = from s in Store,
                select: [s.name, s.cityname, s.state, s.description, s.street, s.zipcode],
                where: s.cityname == ^city and s.state == ^state

        Repo.all query
    end

    def get_store_by_city_state(storename, city, state) do
        query = from s in Store,
                select: [s.name, s.cityname, s.state, s.description, s.street, s.zipcode],
                where: s.name == ^storename and s.cityname == ^city and s.state == ^state

        Repo.all query
    end

    def get_store_by_state(storename, state) do
        query = from s in Store,
                select: [s.name, s.cityname, s.state, s.description, s.street, s.zipcode],
                where: s.state == ^state and s.name == ^storename

        Repo.all query
    end

    def get_all do
        city = from c in City,
                select: [c.name, c.state]
        groceries = from gi in Groceryitem,
                        select: [gi.name, gi.description, gi.price, gi.price_selling_by]
        Repo.all(from Store, preload: [city: ^city, groceryitems: ^groceries])
    end

    def create(store) do
        %{"name" => name, "description" => description, "street" => storestreet, "cityname" => storecity, "state" => storestate, "zipcode" => zipcode} = store

        %City{name: storecity, state: storestate}
        |> get_city
        |> case do
            [] -> IO.puts "City does not exist"
            [city] ->
                city_changeset = City.changeset(city, %{name: city.name, state: city.state})
                store_changeset = Store.changeset(%Store{}, %{name: name, description: description, street: storestreet, cityname: storecity, state: storestate, zipcode: zipcode})
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
        stores = from s in Store,
                    select: [s.id, s.name, s.description, s.cityname, s.state, s.zipcode]
        Repo.all from Groceryitem,
                    preload: [store: ^stores]
    end

    def get_all_from_store(storename) do
        query = from gi in Groceryitem,
                join: s in Store, where: s.id == gi.store_id and s.name == ^storename,
                select: [gi.name, gi.description, gi.price, gi.price_selling_by]
        Repo.all(query)
    end

    def get_grocery_by_name(groceryItemName) do
        stores = from s in Store,
                    select: [s.id, s.name, s.description, s.cityname, s.state, s.zipcode]
        query = from gi in Groceryitem,
                where: gi.name == ^groceryItemName,
                preload: [store: ^stores]
        Repo.all(query)
    end

    def create(grocery_item) do
        # %{name: groceryname, description: grocerydescription, price: groceryprice, price_selling_by: grocerysellingby, store: value} = grocery_item
        %{"name" => groceryname, "description" => grocerydescription, "price" => groceryprice, "price_selling_by" => grocerysellingby, "store" => value } = grocery_item
        # %Suprprices.Store{name: storename, street: streetname, cityname: storecity, state: statename, zipcode: zip} = value
        %{"name" => storename, "street" => streetname, "cityname" => storecity, "state" => statename, "zipcode" => zip} = value

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