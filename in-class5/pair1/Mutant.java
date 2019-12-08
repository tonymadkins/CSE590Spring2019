// The mutation is on line 8
public class Sample {
    /**
     * mutated_sum(int x, int y, int z) does not compute the sum of x + y + a
     */
    public int mutated_sum(int x, int y, int z){
        int a1 = x + y;
        int a2 = a1 - z;
        return a2;
    }
}
