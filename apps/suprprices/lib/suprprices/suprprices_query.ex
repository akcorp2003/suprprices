defmodule Suprprices.GroceryQueries do
    import Ecto.Query

    alias Suprprices.{Repo, Groceryitem, Store}

    def get_all do
        Repo.all(from Groceryitem)
    end

    def get_all_from_store(storename) do
        query = from gi in Groceryitem,
                join: s in Store, where: s.id == gi.store_id and s.name == ^storename
        Repo.all(query)
    end

    def get_by_id(id) do
        Ecto.get(Groceryitem, id)
    end
end