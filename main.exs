defmodule Solution do
  def read(path) do
    path
    |> File.stream!()
    |> Enum.map(&String.trim/1)
    |> Enum.map(&parse/1)
  end

  def parse(input) do
    [spec, pass] = String.split(input, ": ")
    [range, <<char>>] = String.split(spec, " ")
    [min, max] =
      range
      |> String.split("-")
      |> Enum.map(&String.to_integer/1)

    {min..max, char, pass}
  end

  def validate({range, char, pass}) do
    count = for <<^char <- pass>>, reduce: 0, do: (n -> n + 1)
    count in range
  end

end

data = Solution.read("list.txt")

IO.inspect(Enum.count(data, &Solution.validate/1), label: "Number")