defmodule Cards do
  @moduledoc """
  Provides functions for creating and handling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suites = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suite <- suites, value <- values do
      "#{value} of #{suite}"
    end
  end

  @doc """
  Shuffles the cards in the given deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Verifies if `card` exists inside `deck`.

  ## Examples
      iex> Cards.contains? ["Ace of Clubs", "Three of Diamonds"], "Five of Hearts"
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck_remainder} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a `deck` into the file system based on the `filename`.

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.save deck, "my_deck.txt"
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck of cards from the file system based on `filename`.

  ## Examples
      iex> Cards.load "my_deck"
      ["Ace of Spades", "Five of Diamonds"]
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary_content} -> :erlang.binary_to_term(binary_content)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
  Creates a new deck, shuffles its cards and retrieves a hand of
  cards from it.
  The `hand_size` argument indicates the size of the hand.

  ## Examples
      iex> Cards.create_hand 2
      ["Two of Hearts", "Three of Clubs"]
  """
  def create_hand(hand_size) do
    create_deck
    |> shuffle
    |> deal(hand_size)
  end
end
