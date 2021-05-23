# Recover Binary Search Tree

```java
class Solution {

    private TreeNode first;
    private TreeNode second;

    public void recoverTree(TreeNode root) {
        LinkedList<TreeNode> stack = new LinkedList<>();

        TreeNode cur = root;
        TreeNode pre = null;

        while (cur != null || !stack.isEmpty()) {
            while (cur != null) {
                stack.push(cur);
                cur = cur.left;
            }

            if (!stack.isEmpty()) {
                TreeNode top = stack.pop();

                if (pre != null && pre.val > top.val) {
                    if (first == null) {
                        first = pre;
                        second = top;
                    } else {
                        second = top;
                    }
                }

                pre = top;

                if (top.right != null) {
                    cur = top.right;
                }
            }
        }

        int tmp = first.val;
        first.val = second.val;
        second.val = tmp;
    }
}
```