package com.polimi.esercizio2;

import java.util.Iterator;

public class NewClient {
    public static void main(String[] args) {
        OldCode oldCode = new OldCode();
        NewCode newCode = new NewCode();

        Iterator<String> oldElements =
            new IteratorAdapter(oldCode.getOldElements());
        while (oldElements.hasNext()) {
            System.out.println(oldElements.next());
        }

        Iterator<String> newElements = newCode.getNewElements();
        while (newElements.hasNext()) {
            System.out.println(newElements.next());
        }
    }
}
