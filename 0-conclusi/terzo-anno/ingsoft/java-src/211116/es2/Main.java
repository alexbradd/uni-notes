package es2;

public class Main {
    public static void main(String[] argv) throws InterruptedException {
        Factory factory = new Factory();
        Runnable guy = new Guy(factory);

        Thread t1 = new Thread(factory);
        Thread t2 = new Thread(guy);

        t1.start();
        t2.start();

        t1.join();
        t2.join();
    }
}
