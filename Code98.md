# Validate Binary Search Tree

```Java
    //beats 37.60%
    public boolean isValidBST(TreeNode root) {
        return helper(root,Long.MIN_VALUE,Long.MAX_VALUE);
    }
    
    private boolean helper(TreeNode root,long minBoundary,long maxBoundary){
        if(root==null) return true;
        if(root.val<minBoundary||root.val>maxBoundary) return false;
        return helper(root.left,minBoundary,(long)root.val-1)&&helper(root.right,(long)root.val+1,maxBoundary);
    }
```