defmodule Hangman do
  def score_guess({word, correct, incorrect, 0}, _letter), do: {word, correct, incorrect, 0}

  def score_guess({word, correct, incorrect, guesses_left}, letter) do
    cond do
      String.contains?(word, letter) and not String.contains?(correct, letter) ->
        {word, correct <> letter, incorrect, guesses_left}

      not String.contains?(word, letter) and not String.contains?(incorrect, letter) ->
        {word, correct, incorrect <> letter, guesses_left - 1}

      true ->
        {word, correct, incorrect, guesses_left} # No change if letter was already guessed
    end
  end

  def format_feedback({word, correct, _incorrect, _guesses_left}) do
    word
    |> String.graphemes()
    |> Enum.map(fn letter -> if String.contains?(correct, letter), do: letter, else: "-" end)
    |> Enum.join()
  end
end