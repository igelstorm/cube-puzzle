defmodule RandomDirectionsTest do
  use ExUnit.Case
  doctest RandomDirections

  # turn/2
  test "takes a direction vector and 'turns' it into another direction, based on a number" do
    assert RandomDirections.turn({1, 0, 0}, 0) == {0, 1, 0}
    assert RandomDirections.turn({1, 0, 0}, 1) == {0, 0, 1}
    assert RandomDirections.turn({1, 0, 0}, 2) == {0, -1, 0}
    assert RandomDirections.turn({1, 0, 0}, 3) == {0, 0, -1}

    assert RandomDirections.turn({0, 1, 0}, 0) == {0, 0, 1}
    assert RandomDirections.turn({0, 1, 0}, 1) == {1, 0, 0}
    assert RandomDirections.turn({0, 1, 0}, 2) == {0, 0, -1}
    assert RandomDirections.turn({0, 1, 0}, 3) == {-1, 0, 0}

    assert RandomDirections.turn({0, 0, 1}, 0) == {1, 0, 0}
    assert RandomDirections.turn({0, 0, 1}, 1) == {0, 1, 0}
    assert RandomDirections.turn({0, 0, 1}, 2) == {-1, 0, 0}
    assert RandomDirections.turn({0, 0, 1}, 3) == {0, -1, 0}

    assert RandomDirections.turn({-1, 0, 0}, 0) == {0, -1, 0}
    assert RandomDirections.turn({-1, 0, 0}, 1) == {0, 0, -1}
    assert RandomDirections.turn({-1, 0, 0}, 2) == {0, 1, 0}
    assert RandomDirections.turn({-1, 0, 0}, 3) == {0, 0, 1}

    assert RandomDirections.turn({0, -1, 0}, 0) == {0, 0, -1}
    assert RandomDirections.turn({0, -1, 0}, 1) == {-1, 0, 0}
    assert RandomDirections.turn({0, -1, 0}, 2) == {0, 0, 1}
    assert RandomDirections.turn({0, -1, 0}, 3) == {1, 0, 0}

    assert RandomDirections.turn({0, 0, -1}, 0) == {-1, 0, 0}
    assert RandomDirections.turn({0, 0, -1}, 1) == {0, -1, 0}
    assert RandomDirections.turn({0, 0, -1}, 2) == {1, 0, 0}
    assert RandomDirections.turn({0, 0, -1}, 3) == {0, 1, 0}
  end
end
