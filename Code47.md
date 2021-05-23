# Permutations II

```java
class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();

        List<Integer> solution = new ArrayList<>();

        boolean[] isUsed = new boolean[nums.length];

        permuteUnique(nums, isUsed, res, solution);

        return res;
    }

    private void permuteUnique(int[] nums, boolean[] isUsed, List<List<Integer>> res, List<Integer> solution) {
        if (solution.size() == nums.length) {
            res.add(new ArrayList<>(solution));
            return;
        }

        Set<Integer> tried = new HashSet<>();

        for (int i = 0; i < nums.length; i++) {
            if (isUsed[i]) {
                continue;
            }

            if (!tried.add(nums[i])) {
                continue;
            }

            isUsed[i] = true;
            solution.add(nums[i]);

            permuteUnique(nums, isUsed, res, solution);

            solution.remove(solution.size() - 1);
            isUsed[i] = false;
        }
    }
}
```