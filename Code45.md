# Jump Game II

```java
//beats 43.04%
class Solution {
    public int jump(int[] nums) {
        int curFarest=0;
        int curFar=0;
        int jump=0;
        
        int iter=0;
        while(curFarest<nums.length-1){
            while(iter<=curFar){
                curFarest=Math.max(curFarest,iter+nums[iter++]);
            }
            curFar=curFarest;
            jump++;
        }
        return jump;
    }
}
```