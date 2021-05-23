# Jump Game

```java
class Solution {
    public boolean canJump(int[] nums) {
        int curFar = 0;
        int curFarest = 0;
        int iter = 0;

        while (curFarest < nums.length - 1) {
            while (iter <= curFar) {
                curFarest = Math.max(curFarest, iter + nums[iter++]);
            }

            if (curFarest == curFar) {
                return false;
            }

            curFar = curFarest;
        }

        return true;
    }
}
```