# Remove Duplicates from Sorted List II

```java
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        ListNode iter = head;
        ListNode pre = pseudoHead;

        while (iter != null) {
            if (iter.next != null && iter.val == iter.next.val) {
                while (iter.next != null && iter.val == iter.next.val) {
                    iter = iter.next;
                }

                pre.next = iter.next;
            } else {
                pre = iter;
            }

            iter = iter.next;
        }

        return pseudoHead.next;
    }
}
```