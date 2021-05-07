# Reverse Integer

```java
class Solution {
//beats 45.89%
    public int reverse(int x) {
        boolean isPositive=x>0;
        long absx=Math.abs((long)x);
        long res=0;
        while(absx!=0){
            res=res*10+absx%10;
            absx/=10;
        }
        res=res*(isPositive?1:-1);
        if(res>Integer.MAX_VALUE||res<Integer.MIN_VALUE) return 0;
        return (int)res;
   }
}
```