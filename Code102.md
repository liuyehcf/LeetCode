# Binary Tree Level Order Traversal

```Java
	//beats 5.12%
	public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        Queue<TreeNode> queue=new LinkedList<TreeNode>();
        if(root!=null) queue.offer(root);
        
        while(!queue.isEmpty()){
            int size=queue.size();
            List<Integer> curLevel=new ArrayList<Integer>();
            for(int i=size-1;i>=0;i--){
                TreeNode peek=queue.poll();
                curLevel.add(peek.val);
                if(peek.left!=null) queue.offer(peek.left);
                if(peek.right!=null) queue.offer(peek.right);
            }
            res.add(curLevel);
        }
        return res;
    }
```