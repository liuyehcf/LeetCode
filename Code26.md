# Remove Duplicates from Sorted Array

```Java
	//beats 55.48%
	public int removeDuplicates(int[] nums) {
        int i=0,j=1;
        while(j<nums.length){
            while(j<nums.length&&nums[j]==nums[i]) j++;//<Warn1>:���������ж�j<nums.length
            if(j<nums.length) nums[++i]=nums[j++];//<Warn2>:���������ж�j<nums.length
        }
        return i+1;
    }
```