any_value_has_count? = fn enum, count ->
  Enum.any?(enum, &(length(&1) == count))
end

stream = File.stream!("input/day_2.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(&String.codepoints/1)
  |> Stream.map(fn letters -> Enum.group_by(letters, &(&1)) end)
  |> Stream.map(&Map.values/1)

threes = stream
         |> Stream.map(&(any_value_has_count?.(&1, 3)))
         |> Enum.count(&(&1))

twos = stream
       |> Stream.map(&(any_value_has_count?.(&1, 2)))
       |> Enum.count(&(&1))

IO.puts(threes * twos)
