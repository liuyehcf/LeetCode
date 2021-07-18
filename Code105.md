# Construct Binary Tree from Preorder and Inorder Traversal

```java
class Solution {
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        Map<Integer, Integer> indexesOfInorder = new HashMap<>();

        for (int i = 0; i < inorder.length; i++) {
            int val = inorder[i];
            indexesOfInorder.put(val, i);
        }

        return buildTree(preorder, inorder, indexesOfInorder, 0, preorder.length, 0, inorder.length);
    }

    private TreeNode buildTree(int[] preorder, int[] inorder, Map<Integer, Integer> indexesOfInorder,
                               int preorderLeft, int preorderRight,
                               int inorderLeft, int inorderRight) {
        if (preorderLeft > preorderRight - 1 || inorderLeft > inorderRight - 1
                || preorderLeft >= preorder.length
                || preorderRight < 0
                || inorderLeft >= inorder.length
                || inorderRight < 0) {
            return null;
        }

        TreeNode root = new TreeNode(preorder[preorderLeft]);
        int inorderIndexOfRoot = indexesOfInorder.get(root.val);

        int leftTreeSize = inorderIndexOfRoot - 1 - inorderLeft + 1;
        int rightTreeSize = inorderRight - 1 - (inorderIndexOfRoot + 1) + 1;

        root.left = buildTree(preorder, inorder, indexesOfInorder, preorderLeft + 1, preorderLeft + leftTreeSize + 1, inorderLeft, inorderIndexOfRoot);
        root.right = buildTree(preorder, inorder, indexesOfInorder, preorderLeft + leftTreeSize + 1, preorderRight, inorderIndexOfRoot + 1, inorderRight);

        return root;
    }
}
```