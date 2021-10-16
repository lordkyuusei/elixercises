defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.split(~r/[^[:alnum:]\-]/u, trim: true)
    |> Enum.map(&clean_punctuation/1)
    |> Enum.reduce(%{}, &feed_count_map/2)
  end

  defp clean_punctuation(word) do
    punctuation_regex = ~r/[^\wö\-\']+|\'(?!\w)|(?<!\w)\'/u
    String.replace(word, punctuation_regex, "", trim: true)
  end

  defp feed_count_map(word, map) do
    Map.update(map, word, 1, fn count -> count + 1 end)
  end
end
