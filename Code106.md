# Construct Binary Tree from Inorder and Postorder Traversal

* 注意点，两个数组的左右坐标都是需要的
```Java
	//beats 75.85%
	public TreeNode buildTree(int[] inorder, int[] postorder) {
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i=0;i<inorder.length;i++){
            map.put(inorder[i],i);
        }
        return helper(inorder,0,inorder.length-1,postorder,0,postorder.length-1,map);
    }
    
    private TreeNode helper(int[] inorder, int inBegin, int inEnd, int[] postorder, int postBegin, int postEnd, Map<Integer,Integer> map){
        if(inBegin>inEnd) return null;
        int rootIndex=map.get(postorder[postEnd]);
        int leftSize=rootIndex-1-inBegin+1;
        int rightSize=inEnd-(rootIndex+1)+1;
        TreeNode root=new TreeNode(inorder[rootIndex]);
        root.left=helper(inorder,inBegin,rootIndex-1,postorder,postBegin,postBegin+leftSize-1,map);
        root.right=helper(inorder,rootIndex+1,inEnd,postorder,postBegin+leftSize-1+1,postEnd-1,map);
        return root;
    }
```