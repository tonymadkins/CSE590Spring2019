package triangle.test;

import junit.framework.TestCase;
import static triangle.Triangle.Type.*;

public class TestSuite extends TestCase {

   public void test1() {
        assertEquals (triangle.Triangle.classify(0,1,1), INVALID);
   }
   public void test2() {
        assertEquals (triangle.Triangle.classify(1,1,1), EQUILATERAL);
   }
   public void test3() {
        assertEquals (triangle.Triangle.classify(1,2,3), INVALID);
   }
   public void test4() {
        assertEquals (triangle.Triangle.classify(2,3,4), SCALENE);
   }
   public void test5() {
        assertEquals (triangle.Triangle.classify(2,2,1), ISOSCELES);
   }
   public void test6() {
        assertEquals (triangle.Triangle.classify(2,1,2), ISOSCELES);
   }
   public void test7() {
        assertEquals (triangle.Triangle.classify(1,2,2), ISOSCELES);
   }
   public void test8() {
        assertEquals (triangle.Triangle.classify(2,2,5), INVALID);
   }
   public void test9() {
        assertEquals (triangle.Triangle.classify(1,0,1), INVALID);
   }
   public void test10() {
        assertEquals (triangle.Triangle.classify(1,1,0), INVALID);
   }
   public void test11() {
        assertEquals (triangle.Triangle.classify(2,5,2), INVALID);
   }
   public void test12() {
        assertEquals (triangle.Triangle.classify(2,2,5), INVALID);
   }
   public void test13() {
        assertEquals (triangle.Triangle.classify(2,3,1), INVALID);
   }
   public void test14() {
        assertEquals (triangle.Triangle.classify(3,2,1), INVALID);
   }
}
