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

  # cube?
  test "true for a cube" do
    coordinates = [
      {0, 0, 0},
      {0, 0, 1},
      {0, 0, 2},
      {0, 1, 0},
      {0, 1, 1},
      {0, 1, 2},
      {0, 2, 0},
      {0, 2, 1},
      {0, 2, 2},
      {1, 0, 0},
      {1, 0, 1},
      {1, 0, 2},
      {1, 1, 0},
      {1, 1, 1},
      {1, 1, 2},
      {1, 2, 0},
      {1, 2, 1},
      {1, 2, 2},
      {2, 0, 0},
      {2, 0, 1},
      {2, 0, 2},
      {2, 1, 0},
      {2, 1, 1},
      {2, 1, 2},
      {2, 2, 0},
      {2, 2, 1},
      {2, 2, 2}
    ]

    assert CubePuzzle.cube?(coordinates)
  end

  test "false for not a cube" do
    coordinates = [
      {0, 0, 0},
      {0, 4, 1},
      {0, 0, 2},
      {0, 1, 0},
      {0, 1, 1},
      {0, 1, 2},
      {0, 2, 0},
      {0, 2, 1},
      {0, 2, 2},
      {1, 0, 0},
      {1, 0, 1},
      {1, 0, 2},
      {1, 1, 0},
      {1, 1, 1},
      {1, 1, 2},
      {1, 2, 0},
      {1, 2, 1},
      {1, 2, 2},
      {2, 0, 0},
      {2, 0, 1},
      {2, 0, 2},
      {2, 1, 0},
      {2, 1, 1},
      {2, 1, 2},
      {2, 2, 0},
      {2, 2, 1},
      {2, 2, 2}
    ]

    refute CubePuzzle.cube?(coordinates)
  end

  test "true for a shifted cube" do
    coordinates = [
      {0, -4, 2},
      {0, -4, 3},
      {0, -4, 4},
      {0, -5, 2},
      {0, -5, 3},
      {0, -5, 4},
      {0, -3, 2},
      {0, -3, 3},
      {0, -3, 4},

      {-1, -4, 2},
      {-1, -4, 3},
      {-1, -4, 4},
      {-1, -5, 2},
      {-1, -5, 3},
      {-1, -5, 4},
      {-1, -3, 2},
      {-1, -3, 3},
      {-1, -3, 4},

      {1, -4, 2},
      {1, -4, 3},
      {1, -4, 4},
      {1, -5, 2},
      {1, -5, 3},
      {1, -5, 4},
      {1, -3, 2},
      {1, -3, 3},
      {1, -3, 4},
    ]

    assert CubePuzzle.cube?(coordinates)
  end
end
