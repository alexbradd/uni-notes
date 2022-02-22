// 1 --------------------------------------------------------------------------
public class TimeInterval {

    private float low;
    private float high;

    public float getLow() {...}
    public float getHigh() {...}

    /*@ requires
      @   time != null
      @   && (\forall int i; 0 <= i < times.length - 1; times[i] < times[i + 1]);
      @ ensures
      @   (\exists int i = 0; 0 <= i < times.length - 1;
      @       times[i] == \result.getLow() && times[i + 1] == \result.getHigh())
      @   && timePoint >= \result.low
      @   && timePoint < \result.high;
      @*/
    public static TimeInterval getInterval(float[] times, float timePoint) {...}
}

// 2 --------------------------------------------------------------------------
/*@ requires
  @   text != null && chunk != null && text.length > chunk.length;
  @ ensures
  @   \result == true <==>
  @     (\exists int i; 0 <= i < text.length - chunk.length;
  @       (\forall int j; 0 <= j < chunk.length; text[i+j] == chunk[j]));
  @*/
public static boolean subString(char[] txt, char[] chunk);

// 3 --------------------------------------------------------------------------
/*@ requires
  @   0 <= P1 <= 13 && 0 <= P2 <= 13 && 0 <= L <= 4;
  @ ensures
  @   (\result == -1 <==> (L < 2)) &&
  @   (\result == 0 <==> (L >= 2 && (P1 < 6 || P2 < 6 || P1 + P2 < 16))) &&
  @   (\result == P1 + P2 + L <==> (L >= 2 && P1 >= 6 && P2 >= 6 || P1 + P2 > 16));
  @*/
public static int computeScore(int P1, int P2, int L);

// 3 --------------------------------------------------------------------------
/*@ requires
  @   x != null && y != null &&
  @   (\forall int i; 0 <= i < x.length;
  @     (\forall int j; i <= j <= x.length; x[i] != x[j])) &&
  @   (\forall int k; 0 <= k < y.length;
  @     (\forall int l; i <= l <= y.length; y[i] != y[j]));
  @ ensures
  @   \result == true <==> (x.length == y.length &&
  @     (\forall int i; 0 <= i < x.length;
  @       (\exists int j; 0 <= j < y.length; x[i] == y[j])));
  @*/
public static boolean isPermutation(int[] x, int[] y);

// 5 --------------------------------------------------------------------------
/*@ assignable highs[*]
  @ requires true
  @ ensures
  @   TODO
  @ signals (TooShortException e) highs.length != n;
  @ signals (DucplicateException e)
  @   (\exists int i; 0 <= i < nums.length;
  @     (\exists int j; 0 <= j < nums.length; nums[i] == nums[j]))
  @*/
public static void highLowNums(int[] nums, int[] highs, int n);
