# Minimum Depth of Binary Tree

```java
class Solution {

    private int min;

    public int minDepth(TreeNode root) {
        if (root == null) {
            return 0;
        }

        min = Integer.MAX_VALUE;

        minDepth(root, 0);

        return min;
    }

    private void minDepth(TreeNode root, int depth) {
        if (root.left == null && root.right == null) {
            min = Math.min(min, depth + 1);
            return;
        }

        if (root.left != null) {
            minDepth(root.left, depth + 1);
        }

        if (root.right != null) {
            minDepth(root.right, depth + 1);
        }
    }
}
```