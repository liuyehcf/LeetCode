# Find Peak Element

```java
class Solution {
    public int findPeakElement(int[] nums) {
        int left = 0, right = nums.length - 1;

        // 维护不变性约束：nums[left-1] < nums[left] && nums[right] > nums[right+1]
        // 初始时，区间[left, right]满足该不变性约束
        while (left < right) {
            int mid = left + (right - left >> 1);

            // 此时[mid+1, right]这个区间，满足不变性约束
            if (nums[mid] < nums[mid + 1]) {
                left = mid + 1;
            }
            // 此时[left, mid]这个区间，满足不变性约束
            else if (nums[mid] > nums[mid + 1]) {
                right = mid;
            }
            // 找到两个不相等的值
            else {
                boolean canFind = false;
                for (mid = left; mid + 1 <= right; mid++) {
                    // 此时[mid+1, right]这个区间，满足不变性约束
                    if (nums[mid] < nums[mid + 1]) {
                        canFind = true;
                        left = mid + 1;
                        break;
                    }
                    // 此时[left, mid]这个区间，满足不变性约束
                    else if (nums[mid] > nums[mid + 1]) {
                        canFind = true;
                        right = mid;
                        break;
                    }
                }

                if (!canFind) {
                    return -1;
                }
            }
        }

        return left;
    }
}
```