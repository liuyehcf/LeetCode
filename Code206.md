# Reverse Linked List

```java
class Solution {
//beats 31.28%
    public ListNode reverseList(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        reverse(pseudoHead,null);
        return pseudoHead.next;
    }
    
    private void reverse(ListNode pseudoHead,ListNode tail){
        ListNode iter=pseudoHead.next;
        pseudoHead.next=tail;
        while(iter!=null){
            ListNode tempIterNext=iter.next;
            ListNode tempPseudoHeadNext=pseudoHead.next;
            pseudoHead.next=iter;
            iter.next=tempPseudoHeadNext;
            iter=tempIterNext;
        }
   }
}
```