// 1) Si spefichino in JML gli elementi push() e pull().
//
// 2) Specificare quali aspetti di questi metodi non può essere specificato.
//
//    Non possiamo predicare sull'ordine degli elementi poiché è definita solo
//    la contains() e non la get().
public class PriorityQueue<T> {

  //@ public invariant
  //@   (* peek ritorna sempre il più vecchio elemento a priorità massima *)

  //@ unchanged() ==
  //@   (size() == \old(size()) &&
  //@     (\forall int i; ; size(i) == \old(size(i))) &&
  //@     (\forall T e; ; contains(e) <==> \old(contains(e))) &&
  //@     (\forall T e;
  //@       \old(contains(e));
  //@       getPriority(e) == \old(getPriority(e))) &&
  //@     (size() > 0 ==> peek().equals(\old(peek()))));

  //@ requires
  //@   element != null;
  //@ ensures
  //@   !\old(contains(element)) &&
  //@   size() == \old(size()) + 1 &&
  //@   size(priority) == \old(size(priority) + 1) &&
  //@   (\forall int i; i != priority; size(i) == \old(size(i))) &&
  //@   getPriority(element) == priority &&
  //@   (\forall T e;
  //@     \old(contains(e));
  //@     getPriority(e) == \old(getPriority(e)))
  //@   (\forall T e; e != element; constains(e) <==> \old(contains(e)));
  //@ signals (DuplicateException)
  //@   \old(contains(element)) && unchanged();
  public void push(T element, int priority) throws DuplicateException;

  //@ ensures
  //@   \old(size()) > 0 &&
  //@   size() == \old(size) - 1 &&
  //@   size(getPriority(\result)) == \old(size(getPriority(\result))) - 1 &&
  //@   (\forall int i;
  //@     i != getPriority(\result);
  //@     \size(i) == \old(size(i))) &&
  //@   \old(contains(\result)) &&
  //@   !contains(\result) &&
  //@   \result.equals(\old(peek()))
  //@ signals (EmptyException)
  //@   \old(size()) == 0 && unchanged();
  public T pull() throws EmptyException;

  public T /*@ pure @*/ peek() throws EmptyException;

  public int /*@ pure @*/ size();
  public int /*@ pure @*/ size(int priority);

  public int /*@ pure @*/ contains(T element);

  public int /*@ pure @*/ getPriority(T element) throws UnknownElement;

  @Override
  public /*@ pure @*/ Iterator<T> iterator();
}

// 3) Si assuma che non si includa un iterator ma invece un metodo get(),
//    fornire un invariante pubblico per questa versione.
public class PriorityQueue<T> {

  //@ public invariant
  //@   size() == (\sum int i; ; size(i)) &&
  //@   (\forall T e; contains(e); e != null) &&
  //@   (\forall int i;
  //@     0 < i && i < size();
  //@     (\forall int j;
  //@       0 <j && j < size() && i != j;
  //@       !get(i).equals(get(j)))) &&
  //@   (\forall T e;
  //@     contains(e);
  //@     (\exists int i; 0 < i && i < size(); get(i).equals(e))) &&
  //@   peek().equals(get(0)) &&
  //@   (\forall int i;
  //@     ;
  //@     size(i) == (\numof T e; contains(e); getPriority(e) == i));

  //@ unchanged() ==
  //@   (size() == \old(size()) &&
  //@     (\forall int i; ; size(i) == \old(size(i))) &&
  //@     (\forall T e; ; contains(e) <==> \old(contains(e))) &&
  //@     (\forall T e;
  //@       \old(contains(e));
  //@       getPriority(e) == \old(getPriority(e))) &&
  //@     (size() > 0 ==> peek().equals(\old(peek()))));

  //@ requires
  //@   element != null;
  //@ ensures
  //@   !\old(contains(element)) &&
  //@   size() == \old(size()) + 1 &&
  //@   size(priority) == \old(size(priority) + 1) &&
  //@   (\forall int i; i != priority; size(i) == \old(size(i))) &&
  //@   getPriority(element) == priority &&
  //@   (\forall T e;
  //@     \old(contains(e));
  //@     getPriority(e) == \old(getPriority(e)))
  //@   (\forall T e; e != element; constains(e) <==> \old(contains(e)));
  //@ signals (DuplicateException)
  //@   \old(contains(element)) && unchanged();
  public void push(T element, int priority) throws DuplicateException;

  //@ ensures
  //@   \old(size()) > 0 &&
  //@   size() == \old(size) - 1 &&
  //@   size(getPriority(\result)) == \old(size(getPriority(\result))) - 1 &&
  //@   (\forall int i;
  //@     i != getPriority(\result);
  //@     \size(i) == \old(size(i))) &&
  //@   \old(contains(\result)) &&
  //@   !contains(\result) &&
  //@   \result.equals(\old(peek()))
  //@ signals (EmptyException)
  //@   \old(size()) == 0 && unchanged();
  public T pull() throws EmptyException;

  public T /*@ pure @*/ peek() throws EmptyException;

  public int /*@ pure @*/ size();
  public int /*@ pure @*/ size(int priority);

  public int /*@ pure @*/ contains(T element);
  public T /*@ pure @*/ get(int i);

  public int /*@ pure @*/ getPriority(T element) throws UnknownElement;

  @Override
  public /*@ pure @*/ Iterator<T> iterator();
}
