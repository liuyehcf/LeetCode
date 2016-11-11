# Sum of Left Leaves(左叶子的总和)

* 一个节点左右为空为叶节点
* 另外传入一个参量表明该节点是其父节点的左孩子还是右孩子即可
```Java
	//beats 43.45%
	private int sum;
    public int sumOfLeftLeaves(TreeNode root) {
        if(root==null) return 0;
        sum=0;
        helper(root,false);
        return sum;
    }
    private void helper(TreeNode root,boolean isLeftLeaf){
        if(root.left==null&&root.right==null){
            if(isLeftLeaf)
                sum+=root.val;
            return;
        }
        if(root.left!=null) helper(root.left,true);
        if(root.right!=null) helper(root.right,false);
    }
```