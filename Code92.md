# Reverse Linked List II

```java
class Solution {
    public ListNode reverseBetween(ListNode head, int left, int right) {
        if (left == right) {
            return head;
        }

        ListNode beforeLeft = null;
        ListNode afterRight = null;

        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        ListNode pre = pseudoHead;
        ListNode iter = head;
        int cnt = 0;

        while (iter != null) {
            cnt++;

            if (cnt == left) {
                beforeLeft = pre;
            }

            if (cnt == right) {
                afterRight = iter.next;
            }

            pre = iter;
            iter = iter.next;
        }

        reverse(beforeLeft, afterRight);

        return pseudoHead.next;
    }

    private void reverse(ListNode pseudoHead, ListNode tail) {
        ListNode iter = pseudoHead.next;
        pseudoHead.next = tail;

        while (iter != tail) {
            ListNode next = iter.next;

            ListNode head = pseudoHead.next;

            pseudoHead.next = iter;
            iter.next = head;

            iter = next;
        }
    }
}
```