package com.polimi.es1;

import java.util.ArrayList;
import java.util.List;

public class FindMax {
    public static int findMax(ArrayList<Integer> array, int numThreads) {
        int blockSize = array.size() / numThreads;
        int results[] = new int[numThreads];
        List<Thread> threads = new ArrayList<Thread>();
        for (int i = 0; i < numThreads; i++) {
            Thread t = new Thread(new Worker(array,
                    i * blockSize, (i+1) * blockSize, results, i));
            t.start();
            threads.add(t);
        }

        for (Thread t: threads) {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        int max = 0;
        for (int i = 0; i < numThreads; i++) {
            if (results[i] > max)
                max = results[i];
        }
        return max;
    }
}

class Worker implements Runnable {
    private final ArrayList<Integer> array;
    private final int start;
    private final int end;
    private final int[] results;
    private final int num;

    public Worker(ArrayList<Integer> array,
                  int start,
                  int end,
                  int[] results,
                  int num) {
        this.array = array;
        this.start = start;
        this.end = end;

        this.results = results;
        this.num = num;
    }

    @Override
    public void run() {
        int max = 0;

        for (int i = start; i < end; i++) {
            if (array.get(i) > max) {
                max = array.get(i);
            }
        }

        this.results[num] = max;
    }
}
