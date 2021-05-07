# 

```java
class Solution {
//beats 77.50%
    public int majorityElement(int[] nums) {
        int pre=nums[0];
        int cnt=1;
        for(int i=1;i<nums.length;i++){
            if(nums[i]==pre) {
                cnt++;
            }
            else{
                if(--cnt==0) {
                    pre=nums[i];
                    cnt=1;//<Warn>:missing this
                }
            }
        }
        return pre;
   }
}
```