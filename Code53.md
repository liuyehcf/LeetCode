# Maximum Subarray

## dp

```java
class Solution {
    public int maxSubArray(int[] nums) {
        int[] dp = new int[nums.length + 1];
        int max = Integer.MIN_VALUE;

        for (int i = 1; i <= nums.length; i++) {
            dp[i] = (Math.max(dp[i - 1], 0)) + nums[i - 1];

            max = Math.max(dp[i], max);
        }

        return max;
    }
}
```

## 非dp

```java
class Solution {
    public int maxSubArray(int[] nums) {
        int right = 0;
        int maxSum = Integer.MIN_VALUE;
        int curSum = 0;

        while (right < nums.length) {
            curSum += nums[right];
            maxSum = Math.max(maxSum, curSum);

            if (curSum < 0) {
                curSum = 0;
            }

            right++;
        }

        return maxSum;
    }
}
```