# Jump Game II

```Java
	//beats 87.06%
	public int jump(int[] nums) {
        int curFar=0;
        int farest=curFar;
        int jump=0;
        int iter=0;
        while(farest<nums.length-1){
            while(iter<nums.length&&iter<=curFar){
                farest=Math.max(farest,iter+nums[iter]);
                iter++;
            }
            jump++;
            curFar=farest;
            //iter++;    <Warn>:多了这句，很致命，由于上面的循环是必然会发生的，否则数组是有问题的，也就是不可能到终点
        }
        return jump;
    }
```