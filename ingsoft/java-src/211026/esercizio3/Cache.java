package com.polimi.esercizio3;

import java.util.HashMap;

public class Cache implements ApplicationInterface {
    private HashMap<Object, Object> c;
    private ApplicationInterface a;

    public Cache() {
        this.c = new HashMap();
        this.a = new ApplicationLogic();
    }

    @Override
    public Object performOperation(Object parameter) {
        Object cached = c.get(parameter);

        if (cached != null)
            return cached;
        else {
            Object r = a.performOperation(parameter);
            c.put(parameter, r);
            return r;
        }
    }
}
