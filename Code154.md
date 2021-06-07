# Find Minimum in Rotated Sorted Array II

```java
class Solution {
    public int findMin(int[] nums) {
        int left = 0, right = nums.length - 1;

        while (left < right) {
            int mid = left + (right - left >> 1);

            // left part is sorted
            if (nums[mid] > nums[right]) {
                left = mid + 1;
            }
            // right part is sorted
            else if (nums[mid] < nums[left]) {
                right = mid;
            }
            // all sorted
            else if (nums[mid] > nums[left] && nums[mid] < nums[right]) {
                return nums[left];
            }
            // cannot judge, so narrow boundary
            else {
                right--;
            }
        }

        return nums[left];
    }
}
```