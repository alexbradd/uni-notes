public /*@ pure @*/ class ImmList<T> {
  public boolean empty();
  public T first() throws EmptyException;
  public ImmList<T> tail();
  public ImmList<T> add(T el) throws NullException;

  //@ requires
  //@   el != null;
  //@ ensures
  //@   empty() ==> (\result == 0) &&
  //@   !empty() ==> (\result == tail().count(el) + first().equals(el) ? 1 : 0);
  public int count(T el);
}
