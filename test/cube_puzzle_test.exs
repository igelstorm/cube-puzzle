defmodule CubePuzzleTest do
  use ExUnit.Case
  doctest CubePuzzle

  test "a single straight line" do
    assert CubePuzzle.fold_puzzle([2], [{1, 0, 0}]) == [{0, 0, 0}, {1, 0, 0}, {2, 0, 0}]
  end

  test "two lines in different directions" do
    assert CubePuzzle.fold_puzzle([1, 2], [{1, 0, 0}, {0, -1, 0}]) == [
             {0, 0, 0},
             {1, 0, 0},
             {1, -1, 0},
             {1, -2, 0}
           ]
  end
end
