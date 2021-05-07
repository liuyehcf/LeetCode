# Recover Binary Search Tree

```Java
    //beats 34.36%
    private TreeNode first,second,pre;
    public void recoverTree(TreeNode root) {
        first=null;
        second=null;
        pre=null;
        helper(root);
        
        int temp=first.val;
        first.val=second.val;
        second.val=temp;
    }
    
    private void helper(TreeNode root){
        if(root!=null){
            helper(root.left);
            if(pre!=null&&root.val<pre.val){
                if(first==null){
                    first=pre;
                    second=root;
                }
                else{
                    second=root;
                }
            }
            pre=root;
            helper(root.right);
        }
    }
```