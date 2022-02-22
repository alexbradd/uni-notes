package com.polimi.es2;

import java.util.ArrayList;
import java.util.List;

public class Bank {
    private final List<Account> accounts = new ArrayList<>();

    public int get(int accountID) {
        return accounts.get(accountID).getBalance();
    }

    public void deposit(int accountID, int amount) {
        accounts.get(accountID).add(amount);
    }

    public void withdraw(int accountID, int amount) {
        accounts.get(accountID).withdraw(amount);
    }

    public void transfer(int sourceAccount, int destinationAccount, int amount) {
        boolean ok = false;
        synchronized (accounts.get(sourceAccount)) {
            int beforeSource = accounts.get(sourceAccount).getBalance();
            if (beforeSource >= amount) {
                accounts.get(sourceAccount).withdraw(amount);
                ok = true;
            }
        }

        if (ok == true) {
            accounts.get(destinationAccount).add(amount);
        }
    }
}

class Account {
    private int id;
    private int balance;

    public Account(int id, int balance) {
        this.id = id;
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public synchronized int getBalance() {
        return balance;
    }

    public synchronized void add(int amount) {
        balance += amount;
    }

    public synchronized void withdraw(int amount) {
        balance -= amount;
    }
}