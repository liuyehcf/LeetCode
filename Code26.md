# Remove Duplicates from Sorted Array

```Java
	//beats 55.48%
	public int removeDuplicates(int[] nums) {
        int i=0,j=1;
        while(j<nums.length){
            while(j<nums.length&&nums[j]==nums[i]) j++;//<Warn1>:这里忘记判断j<nums.length
            if(j<nums.length) nums[++i]=nums[j++];//<Warn2>:这里忘记判断j<nums.length
        }
        return i+1;
    }
```