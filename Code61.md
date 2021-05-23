# Rotate List

```java
class Solution {
    public ListNode rotateRight(ListNode head, int k) {
        if (k == 0 || head == null) {
            return head;
        }

        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        ListNode iter = head;
        int len = 0;
        while (iter != null) {
            len++;
            iter = iter.next;
        }

        int index = len - k % len;

        ListNode mid = head;
        int cnt = 0;

        while (++cnt < index) {
            mid = mid.next;
        }

        ListNode first = pseudoHead.next;

        reverse(pseudoHead, mid.next);
        // now first is in the pos of mid
        reverse(first, null);
        reverse(pseudoHead, null);
        return pseudoHead.next;
    }

    private void reverse(ListNode pseudoHead, ListNode tail) {
        ListNode iter = pseudoHead.next;
        pseudoHead.next = tail;

        while (iter != tail) {
            ListNode originalNext = iter.next;
            ListNode originalHead = pseudoHead.next;

            pseudoHead.next = iter;
            iter.next = originalHead;

            iter = originalNext;
        }
    }
}
```