# Combination Sum II

```java
class Solution {
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        Arrays.sort(candidates);
        List<List<Integer>> res = new ArrayList<>();

        combinationSum2(res, new ArrayList<>(), candidates, 0, 0, target);

        return res;
    }

    private void combinationSum2(List<List<Integer>> res, List<Integer> solution,
                                 int[] candidates, int index, int sum, int target) {
        if (sum == target) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int i = index; i < candidates.length; i++) {
            if (sum + candidates[i] > target) {
                break;
            }
            if (i > index && candidates[i] == candidates[i - 1]) {
                continue;
            }

            solution.add(candidates[i]);
            combinationSum2(res, solution, candidates, i + 1, sum + candidates[i], target);
            solution.remove(solution.size() - 1);
        }
    }
}
```