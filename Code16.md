# 3Sum Closest

```java
class Solution {
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);

        int distance = Integer.MAX_VALUE;
        int num = -1;

        for (int i = 0; i < nums.length; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;
            }
            int j = i + 1;
            int k = nums.length - 1;

            while (j < k) {
                if (j > i + 1 && nums[j] == nums[j - 1]) {
                    j++;
                    continue;
                }

                if (k < nums.length - 1 && nums[k] == nums[k + 1]) {
                    k--;
                    continue;
                }


                int curSum = nums[i] + nums[j] + nums[k];
                int curDistance = Math.abs(curSum - target);

                if (curDistance < distance) {
                    distance = curDistance;
                    num = curSum;
                }

                if (curDistance == 0) {
                    return target;
                } else if (curSum < target) {
                    j++;
                } else {
                    k--;
                }
            }
        }

        return num;
    }
}
```