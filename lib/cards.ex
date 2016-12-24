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

    def load(filename) do
        case File.read(filename) do
            {:ok, binary_content} -> :erlang.binary_to_term(binary_content)
            {:error, _reason} -> "That file does not exist"
        end
    end
end
