# Remove Duplicates from Sorted List II

```Java
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
```