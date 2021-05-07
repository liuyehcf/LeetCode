# Binary Tree Maximum Path Sum

```Java
    //beats 9.34%
    int max=0;
    
    public int maxPathSum(TreeNode root) {
        max=Integer.MIN_VALUE;
        helper(root);
        return max;
    }
    
    private int helper(TreeNode root){  //�ú�������������ò����ڵ������·�����ò����ڵ�������һ���˵�
        if(root==null) return 0;
        
        int left=helper(root.left);
        int right=helper(root.right);
        
        if(left<0) left=0;
        if(right<0) right=0;
        
        max=Math.max(max,root.val+left+right);//��������������
        return root.val+Math.max(left,right);
    }
```