# Remove Element

```Java
	public int removeElement(int[] nums, int val) {
        int i=-1,j=0;
        while(j<nums.length){
            if(nums[j]!=val) nums[++i]=nums[j];
            j++;
        }
        return i+1;
    }
```