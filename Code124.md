# Binary Tree Maximum Path Sum

```Java
	//beats 9.34%
	int max=0;
    
    public int maxPathSum(TreeNode root) {
        max=Integer.MIN_VALUE;
        helper(root);
        return max;
    }
    
    private int helper(TreeNode root){  //该函数计算出包含该参数节点的最大和路径，该参数节点是其中一个端点
        if(root==null) return 0;
        
        int left=helper(root.left);
        int right=helper(root.right);
        
        if(left<0) left=0;
        if(right<0) right=0;
        
        max=Math.max(max,root.val+left+right);//将两端连接起来
        return root.val+Math.max(left,right);
    }
```