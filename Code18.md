# 4Sum

```java
class Solution {
    public List<List<Integer>> fourSum(int[] nums, int target) {
        List<List<Integer>> lst = new LinkedList<List<Integer>>();
        Arrays.sort(nums);
        for (int i = 0; i < nums.length - 3; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) continue;
            for (int j = i + 1; j < nums.length - 2; j++) {
                if (j > i + 1 && nums[j] == nums[j - 1]) continue;
                for (int m = j + 1, n = nums.length - 1; m < n; ) {
                    if (nums[i] + nums[j] + nums[m] + nums[n] == target) {
                        lst.add(Arrays.asList(nums[i], nums[j], nums[m], nums[n]));
                        m++;
                        n--;
                        while (m < n && nums[n] == nums[n + 1]) n--;
                        while (m < n && nums[m] == nums[m - 1]) m--;
                    } else if (nums[i] + nums[j] + nums[m] + nums[n] > target) n--;
                    else m++;
                }
            }
        }
        return lst;
    }
}
```