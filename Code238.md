# Product of Array Except Self

```java
class Solution {
//beats 12.05%
    public int[] productExceptSelf(int[] nums) {
        int[] res=new int[nums.length];
        int temp=1;
        Arrays.fill(res,1);
        for(int i=1;i<nums.length;i++){
            res[i]=res[i-1]*nums[i-1];
        }
        for(int i=nums.length-2;i>=0;i--){
            temp*=nums[i+1];
            res[i]*=temp;
        }
        return res;
   }
}
```