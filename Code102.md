# Binary Tree Level Order Traversal

```java
class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<>();

        Queue<TreeNode> queue = new LinkedList<>();

        if (root != null) {
            queue.offer(root);
        }

        while (!queue.isEmpty()) {
            int cnt = queue.size();

            List<Integer> level = new ArrayList<>();

            while (cnt-- > 0) {
                TreeNode top = queue.poll();

                level.add(top.val);

                if (top.left != null) {
                    queue.offer(top.left);
                }

                if (top.right != null) {
                    queue.offer(top.right);
                }
            }

            res.add(level);
        }

        return res;
    }
}
```