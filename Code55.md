# Jump Game

```Java
//beats 36.45%
public class Solution {
    public boolean canJump(int[] nums) {
        int farest=0;
        int curFar=0;
        int iter=0;
        while(farest<nums.length-1){
            while(iter<=curFar){
                farest=Math.max(farest,iter+nums[iter++]);
            }
            if(farest==curFar) return false;
            curFar=farest;
        }
        return true;
    }
}
```