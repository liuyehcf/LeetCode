# Find Minimum in Rotated Sorted Array

```java
class Solution {
    public int findMin(int[] nums) {
        int left = 0;
        int right = nums.length - 1;

        while (left < right) {
            int mid = left + (right - left >> 1);

            // left part is sorted
            if (nums[mid] > nums[right]) {
                left = mid + 1;
            }
            // right part is sorted
            else {
                right = mid;
            }
        }

        return nums[left];
    }
}
```