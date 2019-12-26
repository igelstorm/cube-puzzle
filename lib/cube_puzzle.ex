defmodule CubePuzzle do
  @moduledoc """
  Documentation for CubePuzzle.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CubePuzzle.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
    # Walks in a straight line
    iex> CubePuzzle.walk([2])
    [{0, 0, 0}, {1, 0, 0}, {2, 0, 0}]
  """
  def walk(moves) do
    moves
    |> List.foldl([{0, 0, 0}], fn move, acc -> step(acc, {1, 0, 0}, move) end)
    |> Enum.reverse()
  end

  @doc """
  Given a previous path and a direction, adds one or more new steps in the given direction.
    iex> CubePuzzle.step([{0, 0, 0}], {1, 0, 0}, 1)
    [{1, 0, 0}, {0, 0, 0}]

    iex> CubePuzzle.step([{0, 0, 0}], {1, 0, 0}, 3)
    [{3, 0, 0}, {2, 0, 0}, {1, 0, 0}, {0, 0, 0}]

    iex> CubePuzzle.step([{1, 0, 0}, {0, 0, 0}], {0, -1, 0}, 1)
    [{1, -1, 0}, {1, 0, 0}, {0, 0, 0}]
  """
  def step(path, _direction, 0), do: path
  def step(path, direction, n) do
    [last_position | _] = path
    next_position = add_vector(last_position, direction)
    step(
      [next_position | path],
      direction,
      n - 1
    )
  end
  defp add_vector({a, b, c}, {d, e, f}), do: {a + d, b + e, c + f}

  @doc """
  Takes a direction vector and an arbitrary number in 0..3.
  Turns in one of the four possible directions and returns a new direction vector.

    iex> CubePuzzle.turn({1, 0, 0}, 0)
    {0, 1, 0}

    iex> CubePuzzle.turn({-1, 0, 0}, 1)
    {0, -1, 0}

    iex> CubePuzzle.turn({0, 0, 1}, 3)
    {0, -1, 0}
  """
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
