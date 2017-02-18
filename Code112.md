# Path Sum

```Java
	public boolean hasPathSum(TreeNode root, int sum) {
        if(root==null) return false;
        return helper(root,sum,0);
    }
    
    private boolean helper(TreeNode root,int sum,int curVal){
        curVal+=root.val;

        if(root.left==null&&root.right==null){
            return sum==curVal;
        }
        
        
        if(root.left!=null&&root.right!=null){
            return helper(root.left,sum,curVal)||helper(root.right,sum,curVal);
        }
        else if(root.left!=null){
            return helper(root.left,sum,curVal);
        }
        else{
            return helper(root.right,sum,curVal);
        }
    }
```


```Java
	//beats 13.80%
	boolean flag;
    public boolean hasPathSum(TreeNode root, int sum) {
        flag=false;
        if(root==null) return false;
        helper(root,sum,0);
        return flag;
    }
    
    private void helper(TreeNode root,int sum,int curVal){
        if(flag) return;
        curVal+=root.val;
        
        if(root.left==null&&root.right==null) {
            if(curVal==sum) flag=true;
            return;
        }
        
        if(root.left!=null) helper(root.left,sum,curVal);
        if(root.right!=null) helper(root.right,sum,curVal);
    }
```