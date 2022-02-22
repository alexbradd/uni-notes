package es2;

import java.util.Random;

public class Guy implements Runnable {
    private final Factory f;
    private final Random rand = new Random();

    public Guy(Factory f) {
        this.f = f;
    }

    public void run() {
        try {
            while (true) {
                Thread.sleep(rand.nextInt(6) * 1000);
                f.tryOpenValve();
                if (f.closed())
                    return;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
