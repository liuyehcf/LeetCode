# First Missing Positive

```Java
	//beats 70.30%
	public int firstMissingPositive(int[] nums) {
        int i=0,boundary=nums.length;
        while(i<boundary){
            if(nums[i]<=0||nums[i]>boundary){
                exchange(nums,i,boundary-1);
                boundary--;
            }
            else{
                if(nums[i]==i+1) {
                    i++;
                }
                else if(nums[nums[i]-1]==nums[i]) {
                    exchange(nums,i,boundary-1);
                    boundary--;
                }
                else{
                    exchange(nums,i,nums[i]-1);
                }
            }
        }
        return i+1;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```