package com.polimi.esercizio2;

import java.util.Enumeration;

public class LegacyClient {
    public static void main(String[] args) {
        OldCode oldCode = new OldCode();
        NewCode newCode = new NewCode();

        Enumeration<String> oldElements = oldCode.getOldElements();
        while (oldElements.hasMoreElements()) {
            System.out.println(oldElements.nextElement());
        }

       Enumeration<String> newElements =
           new EnumerationAdapter(newCode.getNewElements());
       while (newElements.hasMoreElements()) {
           System.out.println(newElements.nextElement());
       }
    }


}
