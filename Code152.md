# Maximum Product Subarray

```java
class Solution {
//beats 13.69%
    public int maxProduct(int[] nums) {
        if(nums==null||nums.length==0) return 0;
        int[] dpMin=new int[nums.length];
        int[] dpMax=new int[nums.length];
        
        Arrays.fill(dpMin,Integer.MAX_VALUE);
        Arrays.fill(dpMax,Integer.MIN_VALUE);
        
        dpMin[0]=nums[0];
        dpMax[0]=nums[0];
        int res=nums[0];

        for(int i=1;i<nums.length;i++){
            if(nums[i]>=0){
                dpMax[i]=Math.max(nums[i],nums[i]*dpMax[i-1]);
                dpMin[i]=Math.min(nums[i],nums[i]*dpMin[i-1]);
            }
            else{
                dpMax[i]=Math.max(nums[i],nums[i]*dpMin[i-1]);
                dpMin[i]=Math.min(nums[i],nums[i]*dpMax[i-1]);
            }
            res=Math.max(res,dpMax[i]);
        }
        return res;
   }
}
```