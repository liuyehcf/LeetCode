# Maximum Subarray

```Java
//beats 91.59%
public class Solution {
    public int maxSubArray(int[] nums) {
        if(nums==null||nums.length==0) return 0;
        int[] dp=new int[nums.length];
        
        dp[0]=nums[0];
        int res=dp[0];

        
        for(int i=1;i<nums.length;i++){
            dp[i]=(dp[i-1]>=0?dp[i-1]:0)+nums[i];
            res=Math.max(res,dp[i]);
        }
        return res;
    }
}
```