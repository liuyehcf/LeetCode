# Jump Game

```Java
	//beats 8.23%
	public boolean canJump(int[] nums) {
        int curFar=0;
        int farest=0;
        int iter=0;
        while(farest<nums.length-1){
            while(iter<=curFar){
                farest=Math.max(farest,iter+nums[iter]);
                iter++;
            }
            if(farest<nums.length-1&&farest==curFar) return false;
            curFar=farest;
        }
        return true;
    }
```