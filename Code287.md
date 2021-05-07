# Find the Duplicate Number

```Java
    //beats 55.26%
public class Solution {
    public int findDuplicate(int[] nums) {
        int iter=0;
        while(iter<nums.length){
            if(nums[iter]==iter+1) iter++;
            else{
                if(nums[nums[iter]-1]==nums[iter]) return nums[iter];
                else{
                    exchange(nums,iter,nums[iter]-1);
                }
            }
        }
        return -1;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
}
```