package com.polimi.es1;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Main {

    public static void main(String[] args) throws InterruptedException {
        final Pot pot = new Pot(10);
        Runnable camper = () -> {
            while(true) {
                try {
                    pot.eat();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        };
        Runnable cook = () -> {
            while (true) {
                try {
                    pot.fill();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        };

        int campers = 2;
        ExecutorService s = Executors.newFixedThreadPool(campers + 1);
        for (int i = 0; i < campers; i++)
            s.submit(camper);
        s.submit(cook);
        s.shutdown();
        s.awaitTermination(1, TimeUnit.MINUTES);
        s.shutdownNow();
    }
}
