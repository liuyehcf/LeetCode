# Coin Change
```java
class Solution {
//beats 37.15%
    public int coinChange(int[] coins, int amount) {
    if(amount<1) return 0;
    int[] dp=new int[amount+1];
    Arrays.fill(dp,-1);
    dp[0]=0;
    for(int sum=1;sum<=amount;sum++){
        for(int coin:coins){
            if(sum>=coin&&dp[sum-coin]!=-1){
                if(dp[sum]==-1) dp[sum]=dp[sum-coin]+1;
                else dp[sum]=Math.min(dp[sum],dp[sum-coin]+1);
            }
        }
    }
    
    return dp[amount];
   }
}
```