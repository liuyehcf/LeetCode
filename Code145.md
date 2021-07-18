# Binary Tree Postorder Traversal

**方法1：右序前序遍历的倒排**

```java
class Solution {
    public List<Integer> postorderTraversal(TreeNode root) {
        LinkedList<TreeNode> stack = new LinkedList<>();

        TreeNode cur = root;

        List<Integer> res = new LinkedList<>();

        while (cur != null || !stack.isEmpty()) {
            while (cur != null) {
                res.add(0, cur.val);
                stack.push(cur);
                cur = cur.right;
            }

            if (!stack.isEmpty()) {
                TreeNode top = stack.pop();
                cur = top.left;
            }
        }

        return res;
    }
}
```

**方法2：**

```java
class Solution {
    public List<Integer> postorderTraversal(TreeNode root) {
        LinkedList<TreeNode> stack = new LinkedList<>();

        TreeNode pre = null;

        if (root != null) {
            stack.push(root);
        }

        List<Integer> res = new ArrayList<>();

        while (!stack.isEmpty()) {
            TreeNode top = stack.peek();
            if (top.left == null && top.right == null
                    || (pre != null && (pre == top.left || pre == top.right))) {
                pre = top;
                res.add(top.val);
                stack.pop();
            } else {
                if (top.right != null) {
                    stack.push(top.right);
                }

                if (top.left != null) {
                    stack.push(top.left);
                }
            }
        }

        return res;
    }
}
```