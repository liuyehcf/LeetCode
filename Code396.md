# Rotate Function

* ���淽��������

```java
class Solution {
//beats 15%
    public int maxRotateFunction(int[] A) {
        if(A.length==0) return 0;
        int res=Integer.MIN_VALUE;
        for(int i=0;i<A.length;i++){
            res=Math.max(res,helper(A,i));
        }
        return res;
    }
    
    private int helper(int[] A,int firstValue){
        int iter=firstValue;
        int res=0;
        for(int i=0;i<A.length;i++){
            res+=iter*A[i];
            if(++iter==A.length)
                iter=0;
        }
        return res;
   }
}
```