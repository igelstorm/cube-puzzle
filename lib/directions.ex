defmodule Directions do
  @starting_direction {1, 0, 0}

  def from_numbers(numbers) do
    numbers
    |> Enum.reduce([@starting_direction], &add_turn/2)
    |> Enum.reverse()
  end

  defp add_turn(n, directions) do
    [last_direction | _] = directions
    [turn(last_direction, n) | directions]
  end

  def turn({a, b, c}, 0), do: {c, a, b}
  def turn({a, b, c}, 1), do: {b, c, a}
  def turn({a, b, c}, 2), do: {-c, -a, -b}
  def turn({a, b, c}, 3), do: {-b, -c, -a}
end
