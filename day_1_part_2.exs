File.stream!("input/day_1.txt")
  |> Enum.map(&String.trim/1)
  |> Enum.map(&String.to_integer/1)
  |> Stream.cycle()
  |> Stream.scan(&+/2)
  |> Stream.scan(MapSet.new(), fn item, acc ->
    if MapSet.member?(acc, item) do
      item
    else
      MapSet.put(acc, item)
    end
  end)
  |> Stream.drop_while(&(!is_integer(&1)))
  |> Enum.to_list
  |> List.first
  |> IO.puts


