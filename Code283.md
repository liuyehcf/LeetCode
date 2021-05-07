# Move Zeroes

```java
//beats 19.86%
class Solution {
    public void moveZeroes(int[] nums) {
        int boundary=0;
        int iter=0;
        while(iter<nums.length){
            if(nums[iter]!=0){
                nums[boundary++]=nums[iter];
            }
            iter++;
        }
        while(boundary<nums.length){
            nums[boundary++]=0;
        }
    }
}
```