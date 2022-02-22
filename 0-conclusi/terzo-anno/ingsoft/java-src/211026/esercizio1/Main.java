package com.polimi.esercizio1;

public class Main {

    public static void main(String[] args) {
        Pizzeria bellaNapoli = new PizzeriaBellaNapoli();
        Pizzeria cinqueTerre = new PizzeriaCinqueTerre();

        Pizza pizza = bellaNapoli.ordinaPizza("margherita");
        System.out.println("Rolando ha ordinato la pizza " + pizza.getNome());
        System.out.println("###############");
        pizza = cinqueTerre.ordinaPizza("pesto");
        System.out.println("Luca ha ordinato la pizza " + pizza.getNome());
    }
}
