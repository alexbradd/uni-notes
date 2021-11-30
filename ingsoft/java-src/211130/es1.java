public class Connect {

  //@ unchanged() ==
  //@   (\forall int r; r >= 1 && r <= 6;
  //@     (\forall int c; c >= 1 && c <= 7; \get(r, c) == \old(get(r, c)))) &&
  //@   winner() == \old(winner());

  public Connect();

  //@ requires
  //@   column >= 1 && column <= 7 && player >= 1 && player <= 2;
  //@
  //@ ensures
  //@   (\exists int r; r >= 1 && r < 6;
  //@     (\forall int r1; r1 >= 1 && r1 < r;
  //@       \old(get(r1, column) > 0) &&
  //@       get(r1, column) == \old(get(r1, column) &&
  //@       \old(get(r, column) == 0) &&
  //@       get(r, column) == player) &&
  //@     (\forall r2; r2 > r && r2 <= 6; get(r2, column) == 0)) &&
  //@   (\forall int r; r >= 1 && r <= 6;
  //@     (\forall int c; c >= 1 && c <= 7;
  //@       c != column &&
  //@       \get(r, c) == \old(get(r, c)))) &&
  //@   (\old(!winner) && \old(get(6, column) == 0));
  //@
  //@ signals (FullColumnException e)
  //@   (\forall int r; r >= 1 && r <= 6; get(r, column) > 0) && unchanged();
  //@ signals (GameOverException e) winner() && unchanged();
  public void put(int column, int player) throws FullColumnException, GameOverException;

  public /*@ pure @*/ int get(int column, int row);

  //@ ensures
  //@   \result == true <==>
  //@     (\exists int c; c >= 1 && c <= 4;
  //@       (\exists int r; r >= 1 && r <= 6;
  //@         (get(r, c) > 0 &&
  //@           get(r, c) == get(r, c + 1) &&
  //@           get(r, c) == get(r, c + 2) &&
  //@           get(r, c) == get(r, c + 3) &&
  //@           get(r, c) == get(r, c + 4)) ||
  //@         (* stessa cosa per diagonale *) ||
  //@         (* stessa cosa per righe *)))
  public /*@ pure @*/ boolean winner();

  //@ ensures
  //@   (\forall int r; r >= 1 && r <= 6;
  //@     (\forall int c; c >= 1 && c <= 7; \get(r, c) == 0))
  public void clear();
}
