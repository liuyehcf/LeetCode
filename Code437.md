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
* 这种解法无法处理重复的问题，即一个点作为起始节点重复出现了多次

* 那么如果将节点作为起始节点存入set，遇到重复就不再作为起始节点，即可避免
```Java
    private int count;
    public int pathSum(TreeNode root, int sum) {
        Set<TreeNode> set=new HashSet<TreeNode>();
        count=0;
        helper(root,sum,0,set);
        return count;
    }
    private void helper(TreeNode root, int sum, int cur, Set<TreeNode> set){
        if(root==null) return;
        cur+=root.val;
        if(cur==sum) count++;
        
        boolean isLeftNotBeingStart=set.add(root.left);
        boolean isRightNotBeingStart=set.add(root.right);
        
        helper(root.left,sum,cur,set);
        if(isLeftNotBeingStart) helper(root.left,sum,0,set);
        helper(root.right,sum,cur,set);
        if(isRightNotBeingStart) helper(root.right,sum,0,set);
    }
```

* 更好的方法DFS
```Java
	public int pathSum(TreeNode root, int sum) {
        if(root == null)
            return 0;
        return findPath(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum);
    }
    
    public int findPath(TreeNode root, int sum){
        int res = 0;
        if(root == null)
            return res;
        if(sum == root.val)
            res++;
        res += findPath(root.left, sum - root.val);
        res += findPath(root.right, sum - root.val);
        return res;
    }
```

* 更更好的方法
```Java
	public int pathSum(TreeNode root, int sum) {
        HashMap<Integer, Integer> preSum = new HashMap();
        preSum.put(0,1);
        helper(root, 0, sum, preSum);
        return count;
    }
    int count = 0;
    public void helper(TreeNode root, int sum, int target, HashMap<Integer, Integer> preSum) {
        if (root == null) {
            return;
        }
        
        sum += root.val;

        if (preSum.containsKey(sum - target)) {
            count += preSum.get(sum - target);
        }
        
        if (!preSum.containsKey(sum)) {
            preSum.put(sum, 1);
        } else {
            preSum.put(sum, preSum.get(sum)+1);
        }
        
        helper(root.left, sum, target, preSum);
        helper(root.right, sum, target, preSum);
        preSum.put(sum, preSum.get(sum) - 1);
    }
```