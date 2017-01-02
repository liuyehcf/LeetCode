# Construct Binary Tree from Preorder and Inorder Traversal

```Java
	//beats 83.65%
	public TreeNode buildTree(int[] preorder, int[] inorder) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i=0;i<inorder.length;i++){
            map.put(inorder[i],i);
        }
        return helper(preorder,0,preorder.length-1,inorder,0,inorder.length-1,map);
    }
    
    private TreeNode helper(int[] preorder,int pBegin,int pEnd,int[] inorder, int iBegin, int iEnd, Map<Integer,Integer> map){
        if(iBegin>iEnd||pBegin>pEnd) return null;
        TreeNode root=new TreeNode(preorder[pBegin]);
        int posOfInorder=map.get(preorder[pBegin]);
        int leftSize=(posOfInorder-1)-iBegin+1;
        int rightSize=iEnd-(posOfInorder+1)+1;
        root.left=helper(preorder,pBegin+1,pBegin+leftSize,inorder,iBegin,posOfInorder-1,map);
        root.right=helper(preorder,pBegin+leftSize+1,pEnd,inorder,posOfInorder+1,iEnd,map);//<Warn>:¥Ì–¥≥…pBegin+leftSize+1+1
        return root;
    }
```