# Search for a Range


```Java
	//beats 30.57%
	public int[] searchRange(int[] nums, int target) {
        int left=0,right=nums.length-1;
        
        if(nums[left]>target||nums[right]<target) return new int[]{-1,-1};
        
        while(left<=right){
            int mid=left+(right-left>>1);
            if(nums[mid]<target){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        
        if(nums[left]!=target) return new int[]{-1,-1};  //Â©ÁËÕâ¾ä
        int boundaryLeft=left;

        left=0;
        right=nums.length-1;
        while(left<=right){
            int mid=left+(right-left>>1);
            if(nums[mid]<=target){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        
        int boundaryRight=right;
        return new int[]{boundaryLeft,boundaryRight};
    }
```