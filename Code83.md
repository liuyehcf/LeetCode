# Remove Duplicates from Sorted List

```java
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        ListNode iter = head;

        while (iter != null) {
            if (iter.next != null && iter.next.val == iter.val) {
                ListNode first = iter;
                while (iter.next != null && iter.next.val == iter.val) {
                    iter = iter.next;
                }

                first.next = iter.next;
            }

            iter = iter.next;
        }

        return pseudoHead.next;
    }
}
```