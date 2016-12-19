# Search Insert Position

```Java
	public int searchInsert(int[] nums, int target) {
        int left=0,right=nums.length-1;
        
        if(target<nums[left]) return 0;
        if(target>nums[right]) return right+1;
        
        while(left<=right){
            int mid=left+(right-left>>1);
            if(nums[mid]<target){  //<Warn>:大小于弄错了
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        return left;
    }
```