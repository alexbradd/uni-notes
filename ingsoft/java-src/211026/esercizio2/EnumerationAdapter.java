package com.polimi.esercizio2;

import java.util.Enumeration;
import java.util.Iterator;

public class EnumerationAdapter<T> implements Enumeration<T> {
    private Iterator<T> i = null;

    public EnumerationAdapter(Iterator<T> i) {
        this.i = i;
    }

    public boolean hasMoreElements() {
        return i.hasNext();
    }

    public T nextElement() {
        return i.next();
    }
}
