# Remove Duplicates from Sorted List II

```java
class Solution {
public ListNode deleteDuplicates(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;//<Warn1:>miss this
        ListNode pre=pseudoHead,iter=head;
        while(iter!=null){
            if(iter.next!=null&&iter.val==iter.next.val){
                int val=iter.val;
                while(iter!=null&&iter.val==val){
                    iter=iter.next;
                }
                pre.next=iter;
            }else{
                pre=iter;
                iter=iter.next;
            }
        }
        return pseudoHead.next;
   }
}
```


```java
//beats 25.25%
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        if(head==null) return null;
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode ppre=pseudoHead;
        ListNode pre=null;
        ListNode iter=head;
        while(iter!=null){
            if(pre==null){
                pre=iter;
                iter=iter.next;
            }
            else{
                if(iter.val==pre.val){
                    while(iter!=null&&iter.val==pre.val){
                        iter=iter.next;
                    }
                    ppre.next=iter;
                    pre=null;
                }
                else{
                    ppre=pre;
                    pre=iter;
                    iter=iter.next;
                }
            }
        }
        return pseudoHead.next;
    }
}
```