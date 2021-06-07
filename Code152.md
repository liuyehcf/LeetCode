# Maximum Product Subarray

```java
class Solution {
    public int maxProduct(int[] nums) {
        int[] minDp = new int[nums.length + 1];
        int[] maxDp = new int[nums.length + 1];

        minDp[0] = 1;
        maxDp[0] = 1;

        int maxProduct = Integer.MIN_VALUE;

        for (int i = 1; i <= nums.length; i++) {
            minDp[i] = Math.min(minDp[i - 1] * nums[i - 1], maxDp[i - 1] * nums[i - 1]);
            minDp[i] = Math.min(nums[i - 1], minDp[i]);

            maxDp[i] = Math.max(minDp[i - 1] * nums[i - 1], maxDp[i - 1] * nums[i - 1]);
            maxDp[i] = Math.max(nums[i - 1], maxDp[i]);

            maxProduct = Math.max(maxProduct, maxDp[i]);
        }

        return maxProduct;
    }
}
```