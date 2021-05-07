# Path Sum II

```Java
    //beats 47.57%
    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        if(root==null) return res;
        
        List<Integer> iter=new ArrayList<Integer>();
        helper(root,sum,0,iter,res);
        return res;
    }
    
    private void helper(TreeNode root,int sum,int curVal,List<Integer> iter,List<List<Integer>> res){
        curVal+=root.val;
        
        iter.add(root.val);
        
        if(root.left==null&&root.right==null){
            if(curVal==sum){
                res.add(new ArrayList<Integer>(iter));
            }
            //���ﲻ��ֱ��return���������û���״̬��
        }
        
        if(root.left!=null) helper(root.left,sum,curVal,iter,res);
        if(root.right!=null) helper(root.right,sum,curVal,iter,res);
        
        iter.remove(iter.size()-1);
    }
```