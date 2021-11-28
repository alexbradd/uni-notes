package com.polimi;

public enum Value {
    Ace(0),
    One(1),
    Two(2),
    Three(3),
    Four(4),
    Five(5),
    Six(6),
    Seven(7),
    Eight(8),
    Nine(9),
    Ten(10),
    Jack(11),
    Queen(12),
    King(13);

    private int value;
    Value(int value) {
        this.value = value;
    }

    public int value() { return this.value; }
}
