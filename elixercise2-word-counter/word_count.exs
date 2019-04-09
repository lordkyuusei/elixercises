defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    list = String.split(sentence, " _,")
    clean_list = clean(list)
    recursive_count(Map.new(), clean_list)
  end

  def clean(list) do
    head = List.pop_at(list, 0)
    unless is_nil(head) do
      String.replace(head, ~/[\W_]+/g, "")
    end
  end

  def recursive_count(word_count, word_list) do
    head = List.pop_at(word_list, 0)
    IO.puts(head)
    if Map.has_key?(word_count, head) == true do
      _ = Map.put(word_count, head, Map.fetch(word_count, head) +1)
    else
      _ = Map.put(word_count, head, 1)
    end
    unless is_nil(word_list) do
      recursive_count(word_count, word_list)
    end
  end
end
