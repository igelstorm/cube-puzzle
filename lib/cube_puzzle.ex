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
