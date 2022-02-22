package com.polimi.esercizio1;

public class PizzeriaCinqueTerre extends Pizzeria {

    @Override
    public Pizza creaPizza(String tipo) {
        switch (tipo) {
            case "pesto":
                return new PizzaGenovese();
            case "olive":
                return new PizzaTaggiasca();
        }
        return null;
    }

}
