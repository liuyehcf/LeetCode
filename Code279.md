# Perfect Squares


```Java
public class Solution {
    public int numSquares(int n) {
        int[] dp=new int[n+1];
        Arrays.fill(dp,Integer.MAX_VALUE);
        for(int i=0;i*i<=n;i++){
            dp[i*i]=1;
        }
        for(int len=2;len<=n;len++){
            
            for(int i=1;i<=len/2;i++){
                dp[len]=Math.min(dp[len],dp[i]+dp[len-i]);
            }
        }
        return dp[n];
    }
}
```