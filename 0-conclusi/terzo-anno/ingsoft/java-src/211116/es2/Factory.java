package es2;

/*
* Un impianto può portarsi dallo stato di funzionamento
* normale `N` in uno stato di gestione di malfunzionamento
* `M`.
*
* Entrato in tale stato, entro 5s deve essere aperta una
* valvola di scarico.
* - Se la valvola viene aperta, essa rimane in tale stato per
*   un tempo non inferiore a 20s e non superiore a 30s,
*   poi lʼimpianto ritorna nello stato `N`.
* - Se non si apre, l'impiano passa ad uno stato di fermo
*   F.
*/

import java.util.Random;

public class Factory implements Runnable {
    private char state = 'N';
    private final Random rand = new Random();

    public void run() {
        int r;
        int rTreshold = (1 << 32) / 2;

        try {
            open();
            while (state != 'F') {
                r = rand.nextInt();
                if (r > rTreshold) {
                    breakdown();
                    while (broken()) {
                        wait(5000);
                    }
                    if (broken())
                        close();
                }
                Thread.sleep(1000);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public synchronized void open() {
        if (!closed()) {
            System.out.println("Factory opened");
            state = 'N';
            notifyAll();
        }
    }

    public synchronized void close() {
        System.out.println("Too late");
        state = 'F';
        notifyAll();
    }

    public synchronized void breakdown() {
        if (!closed()) {
            System.out.println("Critical pressure");
            state = 'M';
            notifyAll();
        }
    }

    public synchronized boolean broken() {
        return state == 'M';
    }

    public synchronized boolean closed() {
        return state == 'N';
    }

    public synchronized void tryOpenValve() {
        int t;
        while(!broken() && !closed()) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        if (!closed()) {
            System.out.println("Opening valve");
            t = 20 + rand.nextInt(10) * 1000;
            try {
                Thread.sleep(t);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            open();
        }
    }
}
