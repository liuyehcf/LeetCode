# Trapping Rain Water

```java
class Solution {
    public int trap(int[] height) {
        if (height.length < 3) {
            return 0;
        }

        int sum = 0;

        int left = 0, right = height.length - 1;
        int leftHigh = height[left];
        int rightHigh = height[right];

        while (left < right) {
            if (leftHigh < rightHigh) {
                int curHigh = height[++left];
                if (curHigh <= leftHigh) {
                    sum += leftHigh - curHigh;
                } else {
                    leftHigh = curHigh;
                }
            } else {
                int curHigh = height[--right];
                if (curHigh <= rightHigh) {
                    sum += rightHigh - curHigh;
                } else {
                    rightHigh = curHigh;
                }
            }
        }

        return sum;
    }
}
```