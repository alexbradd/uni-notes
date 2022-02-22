package com.polimi.esercizio4;

public abstract class Addition implements Coffee {
    private final Coffee base;

    public Addition(Coffee base) {
        this.base = base;
    }

    @Override
    public String ingredients() {
        return base.ingredients();
    }

    @Override
    public float getCost() {
        return base.getCost();
    }
}
