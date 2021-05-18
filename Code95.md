# Unique Binary Search Trees II

动态规划

```java
class Solution {

    private static final List<TreeNode> NULL_LIST = Collections.singletonList(null);

    public List<TreeNode> generateTrees(int n) {
        List<TreeNode>[][] dp = new List[n][n];

        for (int len = 1; len <= n; len++) {
            for (int start = 0; start <= n - len; start++) {
                int end = start + len - 1;


                List<TreeNode> roots = new ArrayList<>();

                for (int rootIndex = start; rootIndex <= end; rootIndex++) {


                    List<TreeNode> leftList = getOf(dp, start, rootIndex - 1);
                    List<TreeNode> rightList = getOf(dp, rootIndex + 1, end);


                    for (TreeNode left : leftList) {
                        for (TreeNode right : rightList) {
                            TreeNode root = new TreeNode(rootIndex + 1);
                            root.left = left;
                            root.right = right;

                            roots.add(root);
                        }
                    }
                }

                dp[start][end] = roots;
            }
        }

        return dp[0][n - 1];
    }

    private List<TreeNode> getOf(List<TreeNode>[][] dp, int i, int j) {
        if (i > j) {
            return NULL_LIST;
        }

        return dp[i][j];
    }
}
```