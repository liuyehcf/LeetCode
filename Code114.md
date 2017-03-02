# Flatten Binary Tree to Linked List

```Java
	//beats 27.93%
	public void flatten(TreeNode root) {
        if(root==null) return;
        helper(root);
    }
    
    private TreeNode[] helper(TreeNode root){
        System.out.println(root.val);
        TreeNode[] res=new TreeNode[2];
        res[0]=root;
        res[1]=root;
        
        TreeNode right=root.right;
        if(root.left!=null){
            TreeNode[] leftRes=helper(root.left);
            res[1].right=leftRes[0];
            res[1].left=null;
            res[1]=leftRes[1];
        }
        if(right!=null){
            TreeNode[] rightRes=helper(right);
            res[1].right=rightRes[0];
            res[1].left=null;
            res[1]=rightRes[1];
        }
        return res;
    }
```


```Java
	private TreeNode pre;
    public void flatten(TreeNode root) {
        pre=null;
        helper(root);
    }
    
    private void helper(TreeNode root){
        if(root!=null){
            TreeNode right=root.right;
            if(pre==null) pre=root;
            else{
                pre.left=null;
                pre.right=root;
                pre=root;
            }
            helper(root.left);
            helper(right);
        }
    }
```