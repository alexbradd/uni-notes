package com.polimi.esercizio2;

import java.util.Enumeration;
import java.util.Vector;

public class OldCode {
    private final Vector<String> vector;

    public OldCode() {
        vector = new Vector<>();
        vector.add("oldElement1");
        vector.add("oldElement2");
        vector.add("oldElement3");
    }

    public Enumeration<String> getOldElements() {
        return vector.elements();
    }

}
