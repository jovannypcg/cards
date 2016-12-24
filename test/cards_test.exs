defmodule CardsTest do
  use ExUnit.Case

  test "create_deck size should be 20" do
    deck = Cards.create_deck

    assert length(deck) == 20
  end

  test "shuffle should mix up a deck" do
    deck = Cards.create_deck

    assert deck != Cards.shuffle(deck)
  end

  test "save should create a file containing a deck" do
    filename = "mydeck"

    {hand, _deck_remainder} = Cards.create_hand(3)

    assert :ok == Cards.save(hand, filename)

    # Cleaning up the file
    File.rm!(filename)
  end
end
