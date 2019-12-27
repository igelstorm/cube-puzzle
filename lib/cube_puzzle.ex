defmodule CubePuzzle do
  @starting_position {0, 0, 0}
  @the_puzzle [2, 1, 1, 2, 1, 2, 1, 1, 2, 2, 1, 1, 1, 2, 2, 2, 2]

  def solve_the_puzzle do
    fold_puzzle(@the_puzzle, random_directions())
  end

  defp random_directions do
    1..length(@the_puzzle)
    |> Enum.map(fn _ -> Enum.random(0..3) end)
    |> Directions.from_numbers()
  end

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
