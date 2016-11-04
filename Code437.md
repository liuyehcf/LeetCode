# 给定目标的所有路径的总数(从上到下的路径，但是上未必是根节点，下未必是叶节点)

## 思路:一个节点继续递归时，要么作为起始节点，要么作为该路径的中间节点

```Java
private int count;
    public int pathSum(TreeNode root, int sum) {
        count=0;
        helper(root,0,sum);
        return count;
    }
    
    private void helper(TreeNode root, int curSum, int targetSum){
        if(root==null) return;
        curSum+=root.val;
        if(curSum==targetSum) {
            count++;
            System.out.println(root.val);
        }
        helper(root.left,0,targetSum);
        helper(root.left,curSum,targetSum);
        helper(root.right,0,targetSum);
        helper(root.right,curSum,targetSum);
    }
```
* 这种解法无法处理重复的问题
