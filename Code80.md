# Remove Duplicates from Sorted Array II

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        int left = -1;
        int right = 0;

        while (right < nums.length) {
            nums[++left] = nums[right++];
            
            if (right < nums.length && nums[right] == nums[right - 1]) {
                nums[++left] = nums[right++];

                while (right < nums.length && nums[right] == nums[right - 1]) {
                    right++;
                }
            }
        }

        return left + 1;
    }
}
```