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


* ջ��
```java
class Solution {
//beats 40.33%
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> res=new ArrayList<Integer>();
        LinkedList<TreeNode> stack=new LinkedList<TreeNode>();
        TreeNode iter=root;
        while(iter!=null||!stack.isEmpty()){
            while(iter!=null){
                stack.push(iter);
                iter=iter.left;
            }
            if(!stack.isEmpty()){
                TreeNode peek=stack.pop();
                res.add(peek.val);
                iter=peek.right;
            }
        }
        return res;
   }
}
```