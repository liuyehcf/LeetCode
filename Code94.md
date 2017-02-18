# Binary Tree Inorder Traversal

* µÝ¹é·¨
```Java
	//beats 40.33%
	public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> res=new ArrayList<Integer>();
        helper(root,res);
        return res;
    }
    
    private void helper(TreeNode root,List<Integer> res){
        if(root!=null){
            helper(root.left,res);
            res.add(root.val);
            helper(root.right,res);
        }
    }
```


* Õ»·¨
```Java
	//beats 40.33%
	public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> res=new ArrayList<Integer>();
        LinkedList<TreeNode> stack=new LinkedList<TreeNode>();
        TreeNode iter=root;
        while(iter!=null||!stack.isEmpty()){
            while(iter!=null){
                stack.push(iter);
                iter=iter.left;
            }
            if(!stack.isEmpty()){
                TreeNode peek=stack.pop();
                res.add(peek.val);
                iter=peek.right;
            }
        }
        return res;
    }
```