# Burst Balloons

```java
class Solution {
    public int maxCoins(int[] nums) {
        int n = nums.length;

        int[][] dp = new int[n + 2][n + 2];

        for (int len = 1; len <= n; len++) {
            for (int start = 1; start <= n - len + 1; start++) {
                int end = start + len - 1;

                // last表示最后一个爆炸
                for (int last = start; last <= end; last++) {
                    dp[start][end] = Math.max(
                            dp[start][end],
                            // 左右边界之外的两个数与最后一个爆炸的数相乘
                            numOf(nums, start - 1) * numOf(nums, last) * numOf(nums, end + 1)
                                    // 左边区间的爆炸值
                                    + dp[start][last - 1]
                                    // 右边区间的爆炸值
                                    + dp[last + 1][end]
                    );
                }
            }
        }

        return dp[1][n];
    }

    private int numOf(int[] nums, int index) {
        if (index <= 0 || index > nums.length) {
            return 1;
        }
        return nums[index - 1];
    }
}
```