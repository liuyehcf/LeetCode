# Construct Binary Tree from Inorder and Postorder Traversal

```java
class Solution {
    public TreeNode buildTree(int[] inorder, int[] postorder) {
        Map<Integer, Integer> indexes = new HashMap<Integer, Integer>();

        for (int i = 0; i < inorder.length; i++) {
            indexes.put(inorder[i], i);
        }

        return buildTree(inorder, 0, inorder.length, postorder, 0, postorder.length, indexes);
    }

    private TreeNode buildTree(int[] inorder, int istart, int iend,
                               int[] postorder, int pstart, int pend,
                               Map<Integer, Integer> indexes) {
        if (istart > iend - 1) {
            return null;
        }

        TreeNode root = new TreeNode(postorder[pend - 1]);
        int rootIndex = indexes.get(root.val);

        int leftSize = (rootIndex - 1) - istart + 1;
        int rightSize = (pend - 1) - (rootIndex + 1) + 1;

        root.left = buildTree(inorder, istart, rootIndex, postorder, pstart, pstart + leftSize, indexes);
        root.right = buildTree(inorder, rootIndex + 1, iend, postorder, pstart + leftSize, pend - 1, indexes);

        return root;
    }
}
```