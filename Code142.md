# Linked List Cycle II

```java
class Solution {
//beats 17.34%
    public ListNode detectCycle(ListNode head) {
        ListNode fast=head,slow=head;
        ListNode meetPoint=null;
        boolean flag=false;
        while(fast!=null&&fast.next!=null){
            if(fast==slow&&flag) {
                meetPoint=fast;
                break;
            }
            fast=fast.next.next;
            slow=slow.next;
            flag=true;
        }
        
        if(meetPoint==null) return null;
        
        ListNode slow1=head,slow2=meetPoint;
        while(slow1!=slow2){
            slow1=slow1.next;
            slow2=slow2.next;
        }
        return slow1;
   }
}
```