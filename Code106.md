# Construct Binary Tree from Inorder and Postorder Traversal

* ע��㣬����������������궼����Ҫ��
```java
class Solution {
//beats 75.85%
    public TreeNode buildTree(int[] inorder, int[] postorder) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i=0;i<inorder.length;i++){
            map.put(inorder[i],i);
        }
        return helper(inorder,0,inorder.length-1,postorder,0,postorder.length-1,map);
    }
    
    private TreeNode helper(int[] inorder,int istart,int iend,int[] postorder,int pstart,int pend,Map<Integer,Integer> map){
        if(istart>iend) return null;
        TreeNode root=new TreeNode(postorder[pend]);
        
        int rootIndexOfInorder=map.get(root.val);
        int leftTreeSize=rootIndexOfInorder-1-istart+1;
        int rightTreeSize=iend-(rootIndexOfInorder+1)+1;
        
        root.left=helper(inorder,istart,rootIndexOfInorder-1,postorder,pstart,pstart+leftTreeSize-1,map);
        root.right=helper(inorder,rootIndexOfInorder+1,iend,postorder,pstart+leftTreeSize-1+1,pend-1,map);
        
        return root;
   }
}
```