defmodule Cards do
    def create_deck do
        values = ["Ace", "Two", "Three", "Four", "Five"]
        suites = ["Spades", "Clubs", "Hearts", "Diamonds"]

        for suite <- suites, value <- values do
            "#{value} of #{suite}"
        end
    end

    def shuffle(deck) do
        Enum.shuffle(deck)
    end

    def contains?(deck, hand) do
        Enum.member?(deck, hand)
    end

    def deal(deck, hand_size) do
        Enum.split(deck, hand_size)
    end

    def save(deck, filename) do
        binary = :erlang.term_to_binary(deck)

        File.write(filename, binary)
    end
end
