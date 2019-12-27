defmodule RandomDirections do
  def turn({a, b, c}, 0), do: {c, a, b}
  def turn({a, b, c}, 1), do: {b, c, a}
  def turn({a, b, c}, 2), do: {-c, -a, -b}
  def turn({a, b, c}, 3), do: {-b, -c, -a}
end
