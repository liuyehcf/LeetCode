# Intersection of Two Linked Lists

```java
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        int lenA = 0;
        ListNode iterA = headA;

        while (iterA != null) {
            lenA++;
            iterA = iterA.next;
        }

        int lenB = 0;
        ListNode iterB = headB;
        while (iterB != null) {
            lenB++;
            iterB = iterB.next;
        }

        iterA = headA;
        iterB = headB;

        while (lenA != lenB) {
            if (lenA > lenB) {
                iterA = iterA.next;
                lenA--;
            } else {
                iterB = iterB.next;
                lenB--;
            }
        }

        while (iterA != null && iterA != iterB) {
            iterA = iterA.next;
            iterB = iterB.next;
        }

        return iterA;
    }
}
```