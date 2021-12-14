// Si specifichino in JML i metodi add(), similar() e complete()
public interface Dictionary {

  //@ unchanged() ==
  //@   (\forall String s; ; \old(contains(s)) <==> contains(s));

  public /*@ pure @*/ boolean contains(String word);

  //@ ensures
  //@   word != null &&
  //@   (\forall String s; \old(contains(s)); contains(s)) &&
  //@   (\forall String s; contains(s); \old(contains(s)) || s.equals(word));
  //@ signals (NullPointerException)
  //@   word == null && unchanged();
  public void add(String word) NullPointerException;

  //@ requires
  //@   word != null;
  //@ ensures
  //@   \result == true <==>
  //@     (\exists String s;
  //@       ;
  //@       contains(s) &&
  //@       s.length == word.length &&
  //@       (\numof int i;
  //@         0 < i && i < s.length;
  //@         x.charAt(i) != word.charAt(i)) <= 1);
  public /*@ pure @*/ boolean similar(String word);

  //@ requires
  //@   word != null &&
  //@   prefix.length >= 3;
  //@ ensures
  //@   \result != null &&
  //@   (\forall String tail;
  //@     ;
  //@     \result.contains(prefix.concat(tail)) <==>
  //@       contains(prefix.concat(tail)));
  public /*@ pure @*/ List<String> complete(String prefix);
}
