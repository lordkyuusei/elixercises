defmodule Bob do

  @doc """
  Returns a string depending on the 'input' content.
  """
  def hey(input) do
    cond do
      hasLetter(input) and isYellingAQuestion(input) -> "Calm down, I know what I'm doing!"
      hasLetter(input) and String.upcase(input) == input -> "Whoa, chill out!"
      String.ends_with?(input, "?") -> "Sure."
      String.trim(input) == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  @doc """
  Returns true if the string do contains at least 1 letter.
  """
  def hasLetter(input) do
    String.upcase(input) != String.downcase(input)
  end

  @doc """
  Returns true if the string do contains at least 1 letter and ends with an '?'
  """
  def isYellingAQuestion(input) do
    String.ends_with?(input, "?") and String.upcase(input) == input
  end
end