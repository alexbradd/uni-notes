package esFunctional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class Main {
    public static void main(String[] args) {
        List<Couple> data = new ArrayList<>();
        // add
        int res = data.stream()
                .filter((c) -> c.int1 >= 0)
                .map((c) -> c.int2)
                .reduce(0, (total, var) -> total += var);
    }

    public static void numeroPari(final List<Integer> numeri) {
        Optional<Integer> i = numeri.stream()
                .filter((n) -> n % 2 == 0)
                .findFirst();

        i.ifPresent((n) -> System.out.println("Il primo numero pari: " + n));
        if (!i.isPresent()) {
            System.out.println("Nessun numero pari");
        }
    }

    public static void people() {
        final List<Person> p = Arrays.asList(
                new Person("John", 20),
                new Person("Sara", 21),
                new Person("Jane", 21),
                new Person("Greg", 35));
        p.stream().sorted(Person::ageDifference).forEach(Person::toString);
    }
}

class Couple {
    public int int1;
    public int int2;
}

class Person {
    private final String name;
    private final int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public int ageDifference(final Person other) {
        return this.age - other.age;
    }

    @Override
    public String toString() {
        return String.format("%s - %d", this.name, this.age);
    }
}
