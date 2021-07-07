#!/usr/bin/env elixir

defmodule Combination do

  def c2(list, _fun) when length(list) < 2, do: :ok

  def c2([a|tail], fun) do
    IO.inspect binding()
    Enum.each(tail, fn(b)-> fun.(a, b) end)
    c2(tail, fun)
  end
end

nums = "./list.txt"
       |> File.stream!([], :line)
       |> Stream.map(&String.trim/1)
       |> Enum.map(&String.to_integer/1)

Combination.c2(nums, fn(a, b)->
  IO.inspect(a, label: "a")
  IO.inspect(b, label: "b")
  IO.inspect(a + b, label: "Soma")
  IO.inspect(a * b, label: "Mult")
  if a + b == 2020 do
    IO.inspect(a * b, label: "Report Repair Result")
  end
end)