# Find Minimum in Rotated Sorted Array II

```Java
	//beats 10.16%
	public int findMin(int[] nums) {
        int res=nums[0];
        for(int i=1;i<nums.length;i++){
            if(nums[i]<nums[i-1]) return nums[i];
        }
        return res;
    }
```