defmodule DirectionsTest do
  use ExUnit.Case
  use ExUnitProperties
  doctest Directions

  test "takes a list of numbers in the range 0..3, and returns corresponding directions" do
    assert Directions.from_numbers([0, 1, 2]) == [
             {1, 0, 0},
             {0, 1, 0},
             {1, 0, 0},
             {0, -1, 0}
           ]
  end

  # TODO: Property-based tests would be nice here.

  # turn/2
  test "takes a direction vector and 'turns' it into another direction, based on a number" do
    assert Directions.turn({1, 0, 0}, 0) == {0, 1, 0}
    assert Directions.turn({1, 0, 0}, 1) == {0, 0, 1}
    assert Directions.turn({1, 0, 0}, 2) == {0, -1, 0}
    assert Directions.turn({1, 0, 0}, 3) == {0, 0, -1}

    assert Directions.turn({0, 1, 0}, 0) == {0, 0, 1}
    assert Directions.turn({0, 1, 0}, 1) == {1, 0, 0}
    assert Directions.turn({0, 1, 0}, 2) == {0, 0, -1}
    assert Directions.turn({0, 1, 0}, 3) == {-1, 0, 0}

    assert Directions.turn({0, 0, 1}, 0) == {1, 0, 0}
    assert Directions.turn({0, 0, 1}, 1) == {0, 1, 0}
    assert Directions.turn({0, 0, 1}, 2) == {-1, 0, 0}
    assert Directions.turn({0, 0, 1}, 3) == {0, -1, 0}

    assert Directions.turn({-1, 0, 0}, 0) == {0, -1, 0}
    assert Directions.turn({-1, 0, 0}, 1) == {0, 0, -1}
    assert Directions.turn({-1, 0, 0}, 2) == {0, 1, 0}
    assert Directions.turn({-1, 0, 0}, 3) == {0, 0, 1}

    assert Directions.turn({0, -1, 0}, 0) == {0, 0, -1}
    assert Directions.turn({0, -1, 0}, 1) == {-1, 0, 0}
    assert Directions.turn({0, -1, 0}, 2) == {0, 0, 1}
    assert Directions.turn({0, -1, 0}, 3) == {1, 0, 0}

    assert Directions.turn({0, 0, -1}, 0) == {-1, 0, 0}
    assert Directions.turn({0, 0, -1}, 1) == {0, -1, 0}
    assert Directions.turn({0, 0, -1}, 2) == {1, 0, 0}
    assert Directions.turn({0, 0, -1}, 3) == {0, 1, 0}
  end
end
