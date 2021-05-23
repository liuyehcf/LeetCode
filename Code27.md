# Remove Element

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        int left = -1;
        int right = 0;

        while (right < nums.length) {
            if (nums[right] != val) {
                nums[++left] = nums[right];
            }

            right++;
        }

        return left + 1;
    }
}
```