package com.polimi.es1;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

public class FindMaxWithExecutor {
    public static int findMax(ArrayList<Integer> array, int numThreads)
            throws InterruptedException, ExecutionException {
        ExecutorService service = Executors.newFixedThreadPool(numThreads);

        int blockSize = array.size() / numThreads;
        List<Future<Integer>> results = new ArrayList<>();

        for (int i = 0; i < numThreads; i++) {
            final int tID = i;
            results.add(service.submit(new Callable<Integer>() {
                @Override
                public Integer call() {
                    int max = 0;
                    for (int i = tID * blockSize;
                            i < (tID + 1) * blockSize; i++)
                        if (array.get(i) > max)
                            max = array.get(i);
                    return max;
                }
            }));
        }
        service.shutdown();
        service.awaitTermination(10, TimeUnit.MINUTES);

        int max = 0;
        for (Future<Integer> i : results) {
            if (i.get() > max) {
                max = i.get();
            }
        }

        service.shutdownNow();
        return max;
    }
}
