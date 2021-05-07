# Binary Tree Zigzag Level Order Traversal

```Java
    //beats 41.11%
    public List<List<Integer>> zigzagLevelOrder(TreeNode root) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        Queue<TreeNode> queue=new LinkedList<TreeNode>();
        if(root!=null) queue.offer(root);
        
        boolean flag=true;
        
        while(!queue.isEmpty()){
            int size=queue.size();
            List<Integer> curLevel=new LinkedList<Integer>();
            for(int i=size-1;i>=0;i--){
                TreeNode peek=queue.poll();
                if(flag)
                    curLevel.add(peek.val);
                else 
                    curLevel.add(0,peek.val);
                if(peek.left!=null) queue.offer(peek.left);
                if(peek.right!=null) queue.offer(peek.right);
            }
            flag=!flag;
            res.add(curLevel);
        }
        
        return res;
    }
```