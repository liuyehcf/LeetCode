# Unique Binary Search Trees


```java
class Solution {
public int numTrees(int n) {
        int[] dp=new int[n+1];
        dp[0]=1;
        dp[1]=1;
        for(int len=2;len<=n;len++){
            for(int leftSize=0;leftSize<len;leftSize++){
                int rightSize=len-leftSize-1;
                dp[len]+=dp[leftSize]*dp[rightSize];
            }
        }
        return dp[n];
   }
}
```