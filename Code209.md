# Minimum Size Subarray Sum

```Java
public class Solution {
    public int minSubArrayLen(int s, int[] nums) {
        if(nums==null||nums.length==0) return 0;
        int res=Integer.MAX_VALUE;
        
        int left=0,right=0;
        int curSum=0;
        while(right<nums.length){
            curSum+=nums[right++];
            while(curSum>=s){
                res=Math.min(res,(right-1)-left+1);
                curSum-=nums[left++];
            }
        }
        
        return res==Integer.MAX_VALUE?0:res;
    }
}
```