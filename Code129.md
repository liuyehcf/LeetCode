# Sum Root to Leaf Numbers

```java
class Solution {

    private int totalSum;

    public int sumNumbers(TreeNode root) {
        totalSum = 0;

        if (root != null) {
            List<Integer> solution = new ArrayList<>();
            sumNumbers(root, solution);
        }

        return totalSum;
    }

    private void sumNumbers(TreeNode root, List<Integer> solution) {
        solution.add(root.val);

        if (root.left == null && root.right == null) {
            totalSum += toNum(solution);
        }

        if (root.left != null) {
            sumNumbers(root.left, solution);
        }

        if (root.right != null) {
            sumNumbers(root.right, solution);
        }

        solution.remove(solution.size() - 1);
    }

    private int toNum(List<Integer> solution) {
        int num = 0;

        for (int i = 0; i < solution.size(); i++) {
            num += solution.get(i) * (int) Math.pow(10, solution.size() - i - 1);
        }

        return num;
    }
}
```