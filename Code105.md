# Construct Binary Tree from Preorder and Inorder Traversal

```java
class Solution {
//beats 84.86%
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i=0;i<inorder.length;i++){
            map.put(inorder[i],i);
        }
        return helper(preorder,0,preorder.length-1,inorder,0,inorder.length-1,map);
        
    }
    
    private TreeNode helper(int[] preorder,int pstart,int pend,int[] inorder,int istart,int iend,Map<Integer,Integer> map){
        if(pstart>pend) return null;
        
        TreeNode root=new TreeNode(preorder[pstart]);
        
        int rootIndexOfInorder=map.get(root.val);
        int leftTreeSize=rootIndexOfInorder-1-istart+1;
        int rightTreeSize=iend-(rootIndexOfInorder+1)+1;
        
        root.left=helper(preorder,pstart+1,pstart+1+leftTreeSize-1,inorder,istart,rootIndexOfInorder-1,map);
        root.right=helper(preorder,pstart+1+leftTreeSize-1+1,pend,inorder,rootIndexOfInorder+1,iend,map);
        return root;
        
   }
}
```