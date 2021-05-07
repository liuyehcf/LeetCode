# Kth Smallest Element in a BST

```java
//beats 52.40%
class Solution {
    private int cnt;
    private int res;
    public int kthSmallest(TreeNode root, int k) {
        cnt=0;
        res=-1;
        helper(root,k);
        return res;
    }
    
    private void helper(TreeNode root,int k){
        if(root!=null){
            helper(root.left,k);
            if(++cnt==k) {
                res=root.val;
                return;
            }
            helper(root.right,k);
        }
    }
}
```