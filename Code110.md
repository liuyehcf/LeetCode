# Balanced Binary Tree

```Java
    //beats 72.87%
    boolean flag;
    public boolean isBalanced(TreeNode root) {
        flag=true;
        helper(root);
        return flag;
    }
    
    private int helper(TreeNode root){
        if(!flag) return 0;
        if(root==null) return 0;
        
        int leftDepth=helper(root.left);
        int rightDepth=helper(root.right);
        
        if(Math.abs(leftDepth-rightDepth)>1) flag=false;
        
        return Math.max(leftDepth,rightDepth)+1;
    }
```