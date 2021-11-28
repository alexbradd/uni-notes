package com.polimi;

import java.util.*;

public class Deck {
    private Stack<Card> deck;

    public Deck() {
        this.deck = new Stack<Card>();
        shuffle();
    }

    private List<Card> getShuffledCardList() {
        List<Card> l = new ArrayList<Card>(52);
        Value[] v = Value.values();
        Suit[] s = Suit.values();
        for (int j = 0; j < 4; j++)
            for (int i = 1; i < 14; i++)
                l.add(new Card(v[i], s[j]));
        Collections.shuffle(l);
        return l;
    }

    public void shuffle() {
        while(!this.deck.empty())
            this.deck.pop();

        List<Card> l = getShuffledCardList();
        for (Card c : l) {
            this.deck.push(c);
        }
    }

    public boolean empty() {
        return this.deck.empty();
    }

    public Card draw() {
        return this.deck.pop();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Deck deck1 = (Deck) o;
        return Objects.equals(deck, deck1.deck);
    }

    @Override
    public int hashCode() {
        return Objects.hash(deck);
    }
}
