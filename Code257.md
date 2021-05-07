# Binary Tree Paths

* 注意需要判断是否为叶节点的递归，必须传入非空节点，而且保存结果是在当前一次递归中，因此无论何种分支都必须回溯
```java
//beats 76.69%
class Solution {
    public List<String> binaryTreePaths(TreeNode root) {
        List<String> res=new ArrayList<String>();
        StringBuilder sb=new StringBuilder();
        if(root==null) return res;
        helper(root,res,sb);
        return res;
    }
    
    private void helper(TreeNode root,List<String> res,StringBuilder sb){
        int originLength=sb.length();
        
        addToPath(sb,root.val);

        if(root.left==null&&root.right==null){
            res.add(sb.toString());
        }
        else{
            if(root.left!=null) helper(root.left,res,sb);
            if(root.right!=null) helper(root.right,res,sb);
        }
        
        sb.setLength(originLength);
    }
    private void addToPath(StringBuilder sb,int val){
        if(sb.length()!=0){
            sb.append("->"+val);
        }
        else{
            sb.append(""+val);
        }
    }
}
```