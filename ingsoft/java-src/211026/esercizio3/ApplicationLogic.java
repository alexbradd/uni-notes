package com.polimi.esercizio3;

public class ApplicationLogic implements ApplicationInterface {

    @Override
    public Object performOperation(Object parameter) {
        int p = (int) parameter;
        return p * p;
    }
}
