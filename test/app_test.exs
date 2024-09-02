defmodule AppTest do
  use ExUnit.Case
  use App.RepoCase
  doctest App

  test "greets the world" do
    assert App.hello() == :world
  end

  test "returns correct result" do
    person = Friends.Person |> Ecto.Query.first() |> Friends.Repo.one()
    assert person.first_name == "Ryan"
    assert person.last_name == "Bigg"
    assert person.age == 29
  end
end
