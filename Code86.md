# Partition List(快排中的partition的链表实现)

```java
class Solution {
    public ListNode partition(ListNode head, int x) {
        ListNode smallPseudoHead = new ListNode();
        ListNode largePseudoHead = new ListNode();

        ListNode smallIter = smallPseudoHead;
        ListNode largeIter = largePseudoHead;

        ListNode iter = head;

        while (iter != null) {
            if (iter.val < x) {
                smallIter.next = iter;
                smallIter = smallIter.next;
            } else {
                largeIter.next = iter;
                largeIter = largeIter.next;
            }

            iter = iter.next;
        }

        smallIter.next = largePseudoHead.next;
        largeIter.next = null;

        return smallPseudoHead.next;
    }
}
```