# Search for a Range

```java
class Solution {
    public int[] searchRange(int[] nums, int target) {
        if (nums.length == 0) {
            return new int[]{-1, -1};
        }
        int left = 0, right = nums.length - 1;

        if (nums[left] > target || nums[right] < target) {
            return new int[]{-1, -1};
        }

        while (left <= right) {
            int mid = left + (right - left >> 1);
            if (nums[mid] >= target) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }

        // 特殊情况
        if (nums[left] != target) return new int[]{-1, -1};
        int leftBoundary = left;

        left = 0;
        right = nums.length - 1;

        while (left <= right) {
            int mid = left + (right - left >> 1);
            if (nums[mid] <= target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        int rightBoundary = right;

        return new int[]{leftBoundary, rightBoundary};
    }
}
```