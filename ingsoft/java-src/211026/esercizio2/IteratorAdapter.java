package com.polimi.esercizio2;

import java.util.Enumeration;
import java.util.Iterator;

public class IteratorAdapter<T> implements Iterator<T> {
    private Enumeration<T> e = null;

    public IteratorAdapter(Enumeration<T> e) {
        this.e = e;
    }

    public boolean hasNext() {
        return e.hasMoreElements();
    }

    public T next() {
        return e.nextElement();
    }
}
