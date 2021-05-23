# Container With Most Water

```java
class Solution {
    public int maxArea(int[] height) {
        int left = 0, right = height.length - 1;
        int max = -1;

        while (left <= right) {
            int cur = calcuate(height, left, right);
            max = Math.max(cur, max);

            if (height[left] <= height[right]) {
                left++;
            } else {
                right--;
            }
        }

        return max;
    }

    private int calcuate(int[] height, int left, int right) {
        return (right - left) * Math.min(height[left], height[right]);
    }
}
```