# Binary Tree Preorder Traversal

```java
class Solution {
    public List<Integer> preorderTraversal(TreeNode root) {
        LinkedList<TreeNode> stack = new LinkedList<>();

        TreeNode cur = root;

        List<Integer> res = new ArrayList<>();

        while (cur != null || !stack.isEmpty()) {
            while (cur != null) {
                res.add(cur.val);
                stack.push(cur);
                cur = cur.left;
            }

            if (!stack.isEmpty()) {
                TreeNode top = stack.pop();
                cur = top.right;
            }
        }

        return res;
    }
}
```