package com.polimi.esercizio2;

import java.util.ArrayList;
import java.util.Iterator;

public class NewCode {
    private final ArrayList<String> arrayList;

    public NewCode() {
        arrayList = new ArrayList<>();
        arrayList.add("newElement1");
        arrayList.add("newElement2");
        arrayList.add("newElement3");
    }

    public Iterator<String> getNewElements() {
        return arrayList.iterator();
    }
}
