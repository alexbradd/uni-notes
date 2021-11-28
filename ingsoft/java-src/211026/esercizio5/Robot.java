package com.polimi.esercizio5;

public class Robot {
    private Behaviour b;

    public void setBehaviour(Behaviour b) {
        this.b = b;
    }

    public void move() {
        this.b.move();
    }
}
