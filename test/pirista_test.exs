defmodule PiristaTest do
  use ExUnit.Case
  doctest Pirista

  test "greets the world" do
    assert Pirista.hello() == :world
  end
end
