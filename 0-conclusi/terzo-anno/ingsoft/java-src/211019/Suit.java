package com.polimi;

public enum Suit {
    Clover(0), Spades(1), Diamonds(2), Hearts(3);

    private int value;
    Suit(int value) {
        this.value = value;
    }

    public int value() { return this.value; }
}
