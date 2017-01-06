# Move Zeroes

```Java
	//beats 19.86%
	public void moveZeroes(int[] nums) {
        int i=-1;
        for(int j=0;j<nums.length;j++){
            if(nums[j]!=0){
                exchange(nums,++i,j);
            }
        }
        for(int j=i+1;j<nums.length;j++){
            nums[j]=0;
        }
    }
    
    private void exchange(int[]nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```