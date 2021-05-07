# Odd Even Linked List

```java
class Solution {
//beats 3.89%
    public ListNode oddEvenList(ListNode head) {
        ListNode oddPseudoHead=new ListNode(0);
        ListNode evenPesudoHead=new ListNode(0);
        boolean flag=true;
        ListNode iter=head;
        ListNode oddIter=oddPseudoHead;
        ListNode evenIter=evenPesudoHead;
        
        while(iter!=null){
            if(flag){
                ListNode tempIterNext=iter.next;
                oddIter.next=iter;
                oddIter=oddIter.next;
                iter=tempIterNext;
            }
            else{
                ListNode tempIterNext=iter.next;
                evenIter.next=iter;
                evenIter=evenIter.next;
                iter=tempIterNext;
            }
            flag=!flag;
        }
        
        oddIter.next=evenPesudoHead.next;
        evenIter.next=null;
        return oddPseudoHead.next;
   }
}
```