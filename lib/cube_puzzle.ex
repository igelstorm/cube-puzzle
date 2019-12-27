defmodule CubePuzzle do
  @starting_position {0, 0, 0}

  def fold_puzzle(moves, directions) do
    moves
    |> Enum.zip(directions)
    |> List.foldl([@starting_position], &step/2)
    |> Enum.reverse()
  end

  defp step({0, _}, path), do: path

  defp step({n, direction}, path) do
    [last_position | _] = path
    next_position = add_vector(last_position, direction)

    step(
      {n - 1, direction},
      [next_position | path]
    )
  end

  defp add_vector({a, b, c}, {d, e, f}), do: {a + d, b + e, c + f}
end
