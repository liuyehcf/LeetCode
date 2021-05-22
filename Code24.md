# Swap Nodes in Pairs

```java
class Solution {
    public ListNode swapPairs(ListNode head) {
        ListNode pseudoHead = new ListNode();
        pseudoHead.next = head;

        ListNode pre = pseudoHead;
        ListNode first = head;

        while (first != null) {
            ListNode second = first.next;
            if (second == null) {
                break;
            }

            ListNode next = second.next;

            pre.next = second;
            second.next = first;
            first.next = next;

            pre = first;

            first = next;
        }

        return pseudoHead.next;
    }
}
```