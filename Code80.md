# Remove Duplicates from Sorted Array II

```Java
	//beats 31.85%
	public int removeDuplicates(int[] nums) {
        int i=-1,j=0;
        int cnt=0;
        while(j<nums.length){
            if(j>0&&nums[j]==nums[j-1]){
                nums[++i]=nums[j++];
                while(j<nums.length&&nums[j]==nums[j-1]) j++;
            }
            else{
                nums[++i]=nums[j++];
            }
        }
        return i+1;
    }
```