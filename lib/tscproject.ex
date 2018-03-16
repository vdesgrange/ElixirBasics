defmodule TSCProject do
  @moduledoc """
    TSCProject Module
  """
  require Apex

  @doc """
    dictionnaries_reducer
  Reduce a List of Map by keys.
  Param : List of Map
  Returns : Map
  """
  def dictionnaries_reducer(states) do
    IO.puts "Reduce a list of map :"
    states
      |> Enum.reduce(fn(x, acc) -> Map.merge(x, acc, fn(_,v1,v2) -> v2 ++ v1 end) end)
    # Next line sort map values.
    #new |> Map.to_list() |> Enum.map(fn({k, v}) -> {k, Enum.sort(v)} end) |> Map.new()
  end

  @doc """
  string_buildable
  Check if a sentence is buildable with a list of strings.
  Param : sentence - String
  Param : bag - List of string
  Returns : Atom
  """
  def string_buildable(sentence, bag) do
    IO.puts "Check if sentence `#{sentence}` is buildable from \n."
    Apex.ap bag

    string_words = sentence
                   |> String.split(" ")
    string_buildable_recc(string_words, bag)
  end

  defp string_buildable_recc([], _) do true end
  defp string_buildable_recc([""], _) do true end
  defp string_buildable_recc([first | rest], bag) do
    bag_without_first = bag -- [first]
    if (Enum.count(bag) == Enum.count(bag_without_first)) do
      false
    else
      string_buildable_recc(rest, bag_without_first)
    end
  end

  @doc """
  main
  """
  def main() do
    states = [
      %{"Singapore" => ["Bugis"]},
      %{"Singapore" => ["Toa Payoh","Orchard"]},
      %{"Malaysia" => ["Johor"]}
    ]

    valid_string = "I want to build a string"
    invalid_string = "Lorem ipsum is invalid"
    bag_of_words = ["this", "is", "a", "bag", "of", "words",
                  "to", "build", "some", "string", "random",
                  "words", "want", "I"]

    Apex.ap states |> dictionnaries_reducer
    Apex.ap string_buildable(valid_string, bag_of_words)
    Apex.ap string_buildable(invalid_string, bag_of_words)
  end

end
