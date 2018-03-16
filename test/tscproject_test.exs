defmodule TSCProjectTest do
  use ExUnit.Case
  doctest TSCProject

  test "Reducer" do
    states1 = [
      %{"A" => ["A"]},
      %{"A" => ["B","C"]},
      %{"B" => ["D"]}
    ]
    expected_result = %{
      "A" => ["A","B","C"],
      "B" => ["D"]
    }
    assert TSCProject.dictionnaries_reducer(states1) == expected_result
  end

  test "String_buildable" do
    bag = ["A","B","C"]
    sentence1 = "A B";
    sentence2 = "A B D";
    sentence3 = "C C A";
    sentence4 = "";

    assert TSCProject.string_buildable(sentence1, bag) == true
    assert TSCProject.string_buildable(sentence2, bag) == false
    assert TSCProject.string_buildable(sentence3, bag) == false
    assert TSCProject.string_buildable(sentence4, []) == true
  end
end
