# Subsets

```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        Arrays.sort(nums);

        List<List<Integer>> res = new ArrayList<>();
        List<Integer> solution = new ArrayList<>();

        subsets(res, solution, nums, 0);

        return res;
    }

    private void subsets(List<List<Integer>> res, List<Integer> solution,
                         int[] nums, int start) {
        res.add(new ArrayList<>(solution));

        for (int i = start; i < nums.length; i++) {
            solution.add(nums[i]);

            subsets(res, solution, nums, i + 1);

            solution.remove(solution.size() - 1);
        }
    }
}
```