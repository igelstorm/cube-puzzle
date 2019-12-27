defmodule CubePuzzle do
  def walk(moves, directions) do
    moves
    |> Enum.zip(directions)
    |> List.foldl([{0, 0, 0}], &step/2)
    |> Enum.reverse()
  end

  def step({0, _}, path), do: path
  def step({n, direction}, path) do
    [last_position | _] = path
    next_position = add_vector(last_position, direction)
    step(
      {n - 1, direction},
      [next_position | path]
    )
  end
  defp add_vector({a, b, c}, {d, e, f}), do: {a + d, b + e, c + f}

  def turn({a, 0, 0}, 0) when a != 0, do: {0, 1, 0}
  def turn({a, 0, 0}, 1) when a != 0, do: {0, -1, 0}
  def turn({a, 0, 0}, 2) when a != 0, do: {0, 0, 1}
  def turn({a, 0, 0}, 3) when a != 0, do: {0, 0, -1}

  def turn({0, a, 0}, 0) when a != 0, do: {1, 0, 0}
  def turn({0, a, 0}, 1) when a != 0, do: {-1, 0, 0}
  def turn({0, a, 0}, 2) when a != 0, do: {0, 0, 1}
  def turn({0, a, 0}, 3) when a != 0, do: {0, 0, -1}

  def turn({0, 0, a}, 0) when a != 0, do: {1, 0, 0}
  def turn({0, 0, a}, 1) when a != 0, do: {-1, 0, 0}
  def turn({0, 0, a}, 2) when a != 0, do: {0, 1, 0}
  def turn({0, 0, a}, 3) when a != 0, do: {0, -1, 0}
end
