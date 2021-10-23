defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  defp feed_nucleotide_map(nucleotide, map) do
    Map.update(map, nucleotide, 1, fn count -> count + 1 end)
  end

  defp init_nucleotide_map(nucleotide, map) do
    Map.put(map, nucleotide, 0)
  end

  defp strand_is_valid(strand) do
    Enum.all?(strand, fn letter -> Enum.member?(@nucleotides, letter) end)
  end

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    if strand_is_valid(strand) do
      Enum.count(strand, fn letter -> letter == nucleotide end)
    else
      {:ko, "error"}
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    if strand_is_valid(strand) do
      map = Enum.reduce(@nucleotides, %{}, &init_nucleotide_map/2)
      Enum.reduce(strand, map, &feed_nucleotide_map/2)
    else
      {:ko, "error"}
    end
  end
end
