# Search in Rotated Sorted Array

* 二分法
```java
class Solution {
    public int search(int[] nums, int target) {
        int left = 0, right = nums.length - 1;

        while (left <= right) {
            int mid = left + (right - left >> 1);

            if (nums[mid] == target) {
                return mid;
            }

            // right side is sorted or left side is unsorted
            if (nums[mid] < nums[right] || nums[mid] < nums[left]) {
                if (nums[mid] < target && target <= nums[right]) {
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
            // left side is sorted or right side is unsorted
            else if (nums[mid] > nums[left] || nums[mid] > nums[right]) {
                if (nums[left] <= target && target < nums[mid]) {
                    right = mid - 1;
                } else {
                    left = mid + 1;
                }
            } else {
                left++;
            }
        }

        return -1;
    }
}
```