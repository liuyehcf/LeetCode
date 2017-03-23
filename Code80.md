# Remove Duplicates from Sorted Array II

```Java
//beats 31.85%
public class Solution {
    public int removeDuplicates(int[] nums) {
        if(nums==null||nums.length==0) return 0;
        
        int boundary=1;
        int cnt=1;
        int pre=nums[0];
        
        for(int i=1;i<nums.length;i++){
            if(nums[i]==pre){
                if(++cnt<=2){
                    nums[boundary++]=nums[i];
                }
            }
            else{
                pre=nums[i];
                cnt=1;
                nums[boundary++]=nums[i];
            }
        }
        
        return boundary;
    }
}