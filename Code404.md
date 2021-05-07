# Sum of Left Leaves(��Ҷ�ӵ��ܺ�)

* һ���ڵ�����Ϊ��ΪҶ�ڵ�
* ���⴫��һ�����������ýڵ����丸�ڵ�����ӻ����Һ��Ӽ���
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