# Next Permutation

```java
class Solution {
    public void nextPermutation(int[] nums) {

        for (int i = nums.length - 2; i >= 0; i--) {
            for (int j = nums.length - 1; j > i; j--) {
                if (nums[i] < nums[j]) {
                    exchange(nums, i, j);
                    Arrays.sort(nums, i + 1, nums.length);
                    return;
                }
            }
        }

        Arrays.sort(nums);
    }

    private void exchange(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }
}
```