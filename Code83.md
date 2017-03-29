# Remove Duplicates from Sorted List

```Java
	//beats 15.20%
	public ListNode deleteDuplicates(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode iter=head;
        while(iter!=null){
            if(iter.next!=null&&iter.next.val==iter.val){
                ListNode firstNode=iter;
                int val=iter.val;
                while(iter!=null&&iter.val==val){
                    iter=iter.next;
                }
                firstNode.next=iter;
            }
            else{
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
```

```Java
//beats 5.79%
public class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        if(head==null) return null;
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
                    pre.next=iter;
                    pre=null;
                }
                else{
                    pre=iter;
                    iter=iter.next;
                }
            }
        }
        return head;
    }
}
```