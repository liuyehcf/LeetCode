# Binary Tree Maximum Path Sum

```java
class Solution {

    private int totalPathSum = Integer.MIN_VALUE;

    public int maxPathSum(TreeNode root) {
        pathSum(root);
        return totalPathSum;
    }

    public int pathSum(TreeNode root) {
        if (root == null) {
            return 0;
        }

        int leftPathSum = pathSum(root.left);
        int rightPathSum = pathSum(root.right);

        totalPathSum = Math.max(totalPathSum, leftPathSum + rightPathSum + root.val);
        totalPathSum = Math.max(totalPathSum, leftPathSum + root.val);
        totalPathSum = Math.max(totalPathSum, rightPathSum + root.val);
        totalPathSum = Math.max(totalPathSum, root.val);

        int maxPathSum = Integer.MIN_VALUE;
        maxPathSum = Math.max(maxPathSum, leftPathSum + root.val);
        maxPathSum = Math.max(maxPathSum, rightPathSum + root.val);
        maxPathSum = Math.max(maxPathSum, root.val);

        return maxPathSum;
    }
}
```