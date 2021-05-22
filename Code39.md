# Combination Sum

```java
class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        Arrays.sort(candidates);

        List<List<Integer>> res = new ArrayList<>();
        ArrayList<Integer> solution = new ArrayList<>();
        
        combinationSum(res, solution, candidates, 0, 0, target);

        return res;
    }

    private void combinationSum(List<List<Integer>> res, List<Integer> solution,
                                int[] candidates, int index, int sum, int target) {
        if (sum == target) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int i = index; i < candidates.length; i++) {
            if (sum + candidates[i] > target) {
                break;
            }

            solution.add(candidates[i]);
            combinationSum(res, solution, candidates, i, sum + candidates[i], target);
            solution.remove(solution.size() - 1);
        }
    }
}
```