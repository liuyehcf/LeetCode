# Insertion Sort List

```java
class Solution {
//beats 74.77%
    public ListNode insertionSortList(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=head;
        while(iter!=null){
            ListNode tempNext=iter.next;
            insert(pseudoHead,iter);
            iter=tempNext;
        }
        return pseudoHead.next;
    }
    
    private void insert(ListNode pseudoHead,ListNode curNode){
        ListNode pre=pseudoHead;
        ListNode iter=pseudoHead.next;
        boolean flag=false;
        while(iter!=null){
            if(curNode.val<iter.val){
                pre.next=curNode;
                curNode.next=iter;
                flag=true;
                break;
            }
            pre=iter;
            iter=iter.next;
        }
        if(!flag){
            pre.next=curNode;
            curNode.next=null;
        }
   }
}
```