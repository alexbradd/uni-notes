package com.polimi.esercizio4;

public class AddCream extends Addition {
    public AddCream(Coffee base) {
        super(base);
    }

    @Override
    public String ingredients() {
        return super.ingredients() + ", cream";
    }

    @Override
    public float getCost() {
        return super.getCost() + 0.5;
    }
}
