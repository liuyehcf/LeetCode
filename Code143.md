# Reorder List


```java
class Solution {
    public void reorderList(ListNode head) {
        ListNode slow = head;
        ListNode fast = head;

        ListNode pre = null;

        while (fast != null && fast.next != null) {
            pre = slow;
            slow = slow.next;
            fast = fast.next.next;
        }

        ListNode middle = pre;

        if (middle == null) {
            return;
        }

        reverse(middle, null);

        ListNode iter = new ListNode();
        ListNode iter1 = head;
        ListNode iter2 = middle.next;

        boolean isLeft = true;

        while (iter1 != middle.next && iter2 != null) {
            if (isLeft) {
                iter.next = iter1;
                iter1 = iter1.next;
            } else {
                iter.next = iter2;
                iter2 = iter2.next;
            }

            iter = iter.next;
            isLeft = !isLeft;
        }

        while (iter1 != middle.next) {
            iter.next = iter1;
            iter1 = iter1.next;
            iter = iter.next;
        }

        while (iter2 != null) {
            iter.next = iter2;
            iter2 = iter2.next;
            iter = iter.next;
        }

        iter.next = null;
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