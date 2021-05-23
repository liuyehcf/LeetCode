# Subsets II

```java
class Solution {
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        Arrays.sort(nums);

        List<List<Integer>> res = new ArrayList<>();
        List<Integer> solution = new ArrayList<>();

        subsetsWithDup(res, solution, nums, 0);

        return res;
    }

    private void subsetsWithDup(List<List<Integer>> res, List<Integer> solution,
                                int[] nums, int start) {
        res.add(new ArrayList<>(solution));

        for (int i = start; i < nums.length; i++) {
            if (i > start && nums[i] == nums[i - 1]) {
                continue;
            }

            solution.add(nums[i]);

            subsetsWithDup(res, solution, nums, i + 1);

            solution.remove(solution.size() - 1);
        }
    }
}
```