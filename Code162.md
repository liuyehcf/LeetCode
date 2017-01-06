# Find Peak Element

```Java
	//beats 1.20%
	public int findPeakElement(int[] nums) {
        for(int i=0;i<nums.length;i++){
            if(get(nums,i)>get(nums,i-1)&&get(nums,i)>get(nums,i+1)) return i;
        }
        throw new RuntimeException();
    }
    
    private long get(int[] nums,int index){
        if(index<0||index>=nums.length) return Long.MIN_VALUE;
        return nums[index];
    }
```