# Sort List

```java
class Solution {
    public ListNode sortList(ListNode head) {
        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        sortList(pseudoHead, null);

        return pseudoHead.next;
    }

    private void sortList(ListNode pseudoHead, ListNode tail) {
        if (pseudoHead.next == tail || pseudoHead.next.next == tail) {
            return;
        }

        ListNode slow = pseudoHead.next;
        ListNode fast = pseudoHead.next;

        while (fast.next != tail && fast.next.next != tail) {
            slow = slow.next;
            fast = fast.next.next;
        }

        ListNode lastNodeOfFirstPart = slow;
        ListNode firstNodeOfSecondPart = slow.next;

        // 不能用原列表中的节点作为伪头和尾部，因为可能因为排序而发生改变
        ListNode tail1 = new ListNode();
        lastNodeOfFirstPart.next = tail1;
        sortList(pseudoHead, tail1);

        ListNode pseudoHead2 = new ListNode();
        pseudoHead2.next = firstNodeOfSecondPart;
        sortList(pseudoHead2, tail);

        pseudoHead.next = merge(pseudoHead, tail1, pseudoHead2, tail);
    }

    private ListNode merge(ListNode pseudoHead1, ListNode tail1, ListNode pseudoHead2, ListNode tail2) {
        ListNode iter1 = pseudoHead1.next;
        ListNode iter2 = pseudoHead2.next;
        ListNode pseudoHead = new ListNode();
        ListNode iter = pseudoHead;
        while (iter1 != tail1 && iter2 != tail2) {
            if (iter1.val <= iter2.val) {
                iter.next = iter1;
                iter1 = iter1.next;
                iter = iter.next;
            } else {
                iter.next = iter2;
                iter2 = iter2.next;
                iter = iter.next;
            }
        }
        while (iter1 != tail1) {
            iter.next = iter1;
            iter1 = iter1.next;
            iter = iter.next;
        }
        while (iter2 != tail2) {
            iter.next = iter2;
            iter2 = iter2.next;
            iter = iter.next;
        }
        iter.next = tail2;
        return pseudoHead.next;
    }
}
```