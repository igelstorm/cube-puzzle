defmodule CubePuzzle do
  @starting_position {0, 0, 0}

  def walk(moves, directions) do
    moves
    |> Enum.zip(directions)
    |> List.foldl([@starting_position], &step/2)
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

  def turn({a, b, c}, 0), do: {c, a, b}
  def turn({a, b, c}, 1), do: {b, c, a}
  def turn({a, b, c}, 2), do: {-c, -a, -b}
  def turn({a, b, c}, 3), do: {-b, -c, -a}
end
