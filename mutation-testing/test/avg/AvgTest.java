package avg;

import org.junit.Ignore;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * Test class for our Avg implementation.
 */
public class AvgTest {
    private static double EPS = 1e-9;

    @Test
    public void test1() {
        double actual = new Avg().avgAbs(new double[]{1,-2,3});
        double expected = 2;
        assertEquals (expected, actual, EPS);
    }

    @Test(expected=IllegalArgumentException.class)
    public void test2() {
        new Avg().avgAbs(new double[]{});
    }

    @Test(expected=IllegalArgumentException.class)
    public void test3() {
        new Avg().avgAbs(null);
    }
}
