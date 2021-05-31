# Insertion Sort List

```java
class Solution {
    public ListNode insertionSortList(ListNode head) {
        ListNode pseudoHead = new ListNode(0);
        ListNode iter = head;
        while (iter != null) {
            ListNode tempNext = iter.next;
            insert(pseudoHead, iter);
            iter = tempNext;
        }
        return pseudoHead.next;
    }

    private void insert(ListNode pseudoHead, ListNode cur) {
        ListNode pre = pseudoHead;
        ListNode iter = pseudoHead.next;
        boolean hasInserted = false;
        while (iter != null) {
            if (cur.val < iter.val) {
                pre.next = cur;
                cur.next = iter;
                hasInserted = true;
                break;
            }
            pre = iter;
            iter = iter.next;
        }
        if (!hasInserted) {
            pre.next = cur;
            cur.next = null;
        }
    }
}
```