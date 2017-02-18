# Maximum Depth of Binary Tree

```Java
	//beats 10.33%
	int max;
    public int maxDepth(TreeNode root) {
        max=0;
        if(root==null) return 0;
        helper(root,1);
        return max;
    }
    
    private void helper(TreeNode root,int high){
        if(root.left==null&&root.right==null) {
            max=Math.max(max,high);
            return;
        }
        
        if(root.left!=null)helper(root.left,high+1);
        if(root.right!=null)helper(root.right,high+1);
    }
```