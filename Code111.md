# Minimum Depth of Binary Tree

```Java
	//beats 17.66%
	int min;
    public int minDepth(TreeNode root) {
        min=Integer.MAX_VALUE;
        if(root==null) return 0;
        helper(root,1);
        return min;
    }
    
    private void helper(TreeNode root,int high){
        if(root.left==null&&root.right==null){
            min=Math.min(min,high);
            return;
        }
        if(root.left!=null) helper(root.left,high+1);
        if(root.right!=null) helper(root.right,high+1);
    }
```