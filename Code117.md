# Populating Next Right Pointers in Each Node II

```Java
	public void connect(TreeLinkNode root) {
        Queue<TreeLinkNode> queue=new LinkedList<TreeLinkNode>();
        if(root!=null) queue.offer(root);
        
        while(!queue.isEmpty()){
            int size=queue.size();
            TreeLinkNode pre=null;
            for(int i=0;i<size;i++){
                TreeLinkNode peek=queue.poll();
                if(pre==null) pre=peek;
                else{
                    pre.next=peek;
                    pre=peek;
                }
                if(peek.left!=null) queue.offer(peek.left);
                if(peek.right!=null) queue.offer(peek.right);
            }
            pre.next=null;
        }
    }
```