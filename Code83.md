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