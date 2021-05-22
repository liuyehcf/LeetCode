#  Permutations

```java
class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res = new ArrayList<>();

        List<Integer> solution = new ArrayList<>();

        boolean[] isUsed = new boolean[nums.length];

        permute(res, solution, isUsed, nums, 0);

        return res;
    }

    private void permute(List<List<Integer>> res, List<Integer> solution, boolean[] isUsed,
                         int[] nums, int index) {
        if (index == nums.length) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int i = 0; i < nums.length; i++) {
            if (isUsed[i]) {
                continue;
            }

            solution.add(nums[i]);
            isUsed[i] = true;

            permute(res, solution, isUsed, nums, index + 1);

            isUsed[i] = false;
            solution.remove(solution.size() - 1);
        }
    }
}
```