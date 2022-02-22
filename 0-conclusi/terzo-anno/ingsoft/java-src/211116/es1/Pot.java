package com.polimi.es1;

public class Pot {
    private final int nPortions;
    private int portions;

    public Pot(int portions) {
        this.portions = portions;
        this.nPortions = portions;
    }

    public synchronized void eat() throws InterruptedException {
        while (portions == 0) {
            wait();
        }
        portions--;
        System.out.println("Someone ate");
        notifyAll();
    }

    public synchronized void fill() throws InterruptedException {
        while(portions != 0) {
            wait();
        }
        portions = nPortions;
        System.out.println("Cook filled the pot");
        Thread.sleep(1000);
        notifyAll();
    }
}
