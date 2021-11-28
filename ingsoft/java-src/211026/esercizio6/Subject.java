package com.polimi.esercizio6;

public interface Subject {
    void registerObserver(Observer o);

    void unregisterObserver(Observer o);

    void notifyObservers();

}
