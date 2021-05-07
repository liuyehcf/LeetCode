# 3Sum Closest


```java
class Solution {
//beats 77.70%
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int diff=Integer.MAX_VALUE;
        int res=0;
        for(int i=0;i<nums.length;i++){
            if(i>0&&nums[i]==nums[i-1]) continue;
            int left=i+1,right=nums.length-1;
            while(left<right){
                int subtract=nums[i]+nums[left]+nums[right]-target;
                if(Math.abs(subtract)<diff) {
                    res=nums[i]+nums[left]+nums[right];
                    diff=Math.abs(subtract);
                }
                if(subtract<0){
                    left++;
                }
                else if(subtract>0){
                    right--;
                }
                else{
                    return res;
                }
            }
        }
        return res;
   }
}
```