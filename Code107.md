#  Binary Tree Level Order Traversal II

```java
class Solution {
//beats 70.16%
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        List<List<Integer>> res=new LinkedList<List<Integer>>();
        
        Queue<TreeNode> queue=new LinkedList<TreeNode>();
        
        if(root!=null) queue.offer(root);
        
        while(!queue.isEmpty()){
            int size=queue.size();
            List<Integer> curLevel=new ArrayList<Integer>();
            for(int i=0;i<size;i++){
                TreeNode peek=queue.poll();
                curLevel.add(peek.val);
                
                if(peek.left!=null) queue.offer(peek.left);
                if(peek.right!=null) queue.offer(peek.right);
            }
            
            res.add(0,curLevel);
        }
        
        return res;
   }
}
```