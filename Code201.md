# Bitwise AND of Numbers Range

public class Solution {
    public int rangeBitwiseAnd(int m, int n) {
        if(n==0) return 0;
        int moveOffset=1;
        while(m!=n){
            m>>=1;
            n>>=1;
            moveOffset<<=1;
        }
        return m*moveOffset;
    }
}