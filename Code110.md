# Balanced Binary Tree

```java
class Solution {
    boolean flag;

    public boolean isBalanced(TreeNode root) {
        flag = true;
        heightsOf(root);
        return flag;
    }

    private int heightsOf(TreeNode root) {
        if (!flag) return 0;
        if (root == null) return 0;

        int leftDepth = heightsOf(root.left);
        int rightDepth = heightsOf(root.right);

        if (Math.abs(leftDepth - rightDepth) > 1) flag = false;

        return Math.max(leftDepth, rightDepth) + 1;
    }
}
```