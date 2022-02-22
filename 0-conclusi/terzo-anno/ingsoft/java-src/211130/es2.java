// Si specifichino in JML i metodi add(), notifyInteraction() e remove()

public class RecentContacts {

  //@ public invariant
  //@   (\forall int i; i >= 0 && i < size();
  //@     get(i) != null &&
  //@     !(\exists int j; j >= 0 && j < size(); get(j).equals(get(i))))

  //@ unchanged() <==>
  //@   \old(size()) == size() &&
  //@   (\forall int i; i >= 0 && i < size(); get(i).equals(\old(get(i))));

  public RecentContacts();

  //@ requires
  //@   content != null;
  //@
  //@ ensures
  //@   size == \old(size) + 1 &&
  //@   get(0).equals(contact) &&
  //@   (\forall int i; i >= 0 && i <= \old(size());
  //@     get(i + 1).equals(\old(get(i)))) &&
  //@   !(\exists int i; i >= 0 && i < \old(size());
  //@     \old(get(i)).equals(get(contact)));
  //@
  //@ signals (ExistingContactException e)
  //@   (\exists int i; i >= 0 && i < size();
  //@     get(i).equals(get(contact))) && unchanged();
  public void add(String contact) throws ExistingContactException;

  //@ requires
  //@   contact != null;
  //@
  //@ ensures
  //@   size() == \old(size()) + 1 &&
  //@   (* tutto ciò che era sopra rimane fermo *) &&
  //@   (* tutto ciò che era sotto shifta di 1 *);
  //@
  //@ signals (UnknownContactException e)
  //@   !(\exists int i; i >= 0 && i < size(); get(i).equals(contact)) &&
  //@   unchanged();
  public void remove(String contact) throws UnknownContactException;

  // simile a remove()
  public void notifyInteraction(String contact) throws UnknownContactException;

  public /*@ pure @*/ String get(int pos);

  public /*@ pure @*/ int size();
}
