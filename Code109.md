# Convert Sorted List to Binary Search Tree

```java
class Solution {
    public TreeNode sortedListToBST(ListNode head) {
        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;
        return sortedListToBST(pseudoHead, null);
    }

    private TreeNode sortedListToBST(ListNode pseudoHead, ListNode tail) {
        if (pseudoHead.next == tail) {
            return null;
        }

        ListNode slowIter = pseudoHead.next;
        ListNode fastIter = pseudoHead.next;

        while (fastIter != tail && fastIter.next != tail) {
            slowIter = slowIter.next;
            fastIter = fastIter.next.next;
        }

        TreeNode root = new TreeNode(slowIter.val);
        root.left = sortedListToBST(pseudoHead, slowIter);
        root.right = sortedListToBST(slowIter, tail);

        return root;
    }
}
```