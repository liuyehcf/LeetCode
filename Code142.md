# Linked List Cycle II

```java
public class Solution {
    public ListNode detectCycle(ListNode head) {
        if (head == null) {
            return null;
        }

        ListNode slow = head;
        ListNode fast = head;
        ListNode meetPoint = null;
        boolean alreadyMeet = false;

        while (fast != null && fast.next != null) {
            if (fast == slow) {
                if (alreadyMeet) {
                    meetPoint = fast;
                    break;
                } else {
                    alreadyMeet = true;
                }
            }

            slow = slow.next;
            fast = fast.next.next;
        }

        if (meetPoint == null) return null;

        ListNode slow1 = head;
        ListNode slow2 = meetPoint;

        while (slow1 != slow2) {
            slow1 = slow1.next;
            slow2 = slow2.next;
        }

        return slow1;
    }
}
```