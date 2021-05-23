# Combinations


```java
class Solution {
    public List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> solution = new ArrayList<>();

        combine(res, solution, n, k, 1);

        return res;
    }

    private void combine(List<List<Integer>> res, List<Integer> solution,
                         int n, int k, int start) {
        if (solution.size() == k) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int i = start; i <= n - (k - solution.size()) + 1; i++) {
            solution.add(i);

            combine(res, solution, n, k, i + 1);

            solution.remove(solution.size() - 1);
        }
    }
}
```