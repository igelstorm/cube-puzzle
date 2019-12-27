defmodule CubePuzzleTest do
  use ExUnit.Case
  doctest CubePuzzle

  # walk/2
  test "walks in a straight line" do
    assert CubePuzzle.walk([2], [{1, 0, 0}]) == [{0, 0, 0}, {1, 0, 0}, {2, 0, 0}]
  end

  test "turns between each move" do
    assert CubePuzzle.walk([1, 1], [{1, 0, 0}, {0, -1, 0}]) == [{0, 0, 0}, {1, 0, 0}, {1, -1, 0}]
  end

  # step/2
  test "can add one new steps in a given direction to an existing path" do
    assert CubePuzzle.step({1, {1, 0, 0}}, [{0, 0, 0}]) == [{1, 0, 0}, {0, 0, 0}]
  end

  test "can add several steps in the same direction" do
    assert CubePuzzle.step({3, {1, 0, 0}}, [{0, 0, 0}]) == [
             {3, 0, 0},
             {2, 0, 0},
             {1, 0, 0},
             {0, 0, 0}
           ]
  end

  test "can add a step in a different direction" do
    assert CubePuzzle.step({1, {0, -1, 0}}, [{1, 0, 0}, {0, 0, 0}]) == [
             {1, -1, 0},
             {1, 0, 0},
             {0, 0, 0}
           ]
  end
end
