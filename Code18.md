# 4Sum

```java
public class Solution {
    public List<List<Integer>> fourSum(int[] nums, int target) {
        Arrays.sort(nums);

        List<List<Integer>> res = new LinkedList<List<Integer>>();

        for (int i = 0; i < nums.length; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;
            }
            for (int j = i + 1; j < nums.length; j++) {
                if (j > i + 1 && nums[j] == nums[j - 1]) {
                    continue;
                }

                int k = j + 1, l = nums.length - 1;

                while (k < l) {
                    if (k > j + 1 && nums[k] == nums[k - 1]) {
                        k++;
                        continue;
                    }

                    if (l < nums.length - 1 && nums[l] == nums[l + 1]) {
                        l--;
                        continue;
                    }

                    int curSum = nums[i] + nums[j] + nums[k] + nums[l];

                    if (curSum == target) {
                        res.add(Arrays.asList(nums[i], nums[j], nums[k], nums[l]));
                        k++;
                        l--;
                    } else if (curSum < target) {
                        k++;
                    } else {
                        l--;
                    }
                }
            }
        }
        return res;
    }
}
```