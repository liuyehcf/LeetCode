# Lowest Common Ancestor of a Binary Tree

* 超时
```Java
public class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root==p||root==q) return root;
        else if(isChild(root.left,p)&&isChild(root.left,q)) return lowestCommonAncestor(root.left,p,q);
        else if(isChild(root.right,p)&&isChild(root.right,q)) return lowestCommonAncestor(root.right,p,q);
        else return root;
    }
    
    private boolean isChild(TreeNode root,TreeNode p){
        if(map.containsKey(root)
        if(root==null) return false;
        if(root==p) return true;
        return isChild(root.left,p)||isChild(root.right,p);
    }
}
```

* Brilliant
```Java
//beats 10.48%
public class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root==null) return null;
        if(root==p||root==q) return root;
        TreeNode leftRes=lowestCommonAncestor(root.left,p,q);
        TreeNode rightRes=lowestCommonAncestor(root.right,p,q);
        if(leftRes!=null&&rightRes!=null) return root; //表明p,q分别位于root的左右子树中
        return leftRes==null?rightRes:leftRes;//p,q位于root的左或者右子树中
    }
}
```