# Search in Rotated Sorted Array II

```Java
	//beats 16.18%
	public boolean search(int[] nums, int target) {
        for(int i=0;i<nums.length;i++){
            if(nums[i]==target) return true;
            if(i<nums.length-1&&nums[i]>nums[i+1]&&target>nums[i]) return false;
        }
        return false;
    }
```