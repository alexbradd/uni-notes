package com.polimi.esercizio1;

public class PizzeriaBellaNapoli extends Pizzeria {

    @Override
    public Pizza creaPizza(String tipo) {
        if (tipo.equals("margherita"))
            return new PizzaNapoletana();
        return null;
    }

}
