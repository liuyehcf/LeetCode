# Binary Tree Inorder Traversal

```java
class Solution {
    public List<Integer> inorderTraversal(TreeNode root) {
        LinkedList<TreeNode> stack = new LinkedList<>();

        TreeNode cur = root;

        List<Integer> res = new ArrayList<>();

        while (cur != null || !stack.isEmpty()) {
            while (cur != null) {
                stack.push(cur);
                cur = cur.left;
            }

            if (!stack.isEmpty()) {
                TreeNode top = stack.pop();
                res.add(top.val);
                cur = top.right;
            }
        }

        return res;
    }
}
```