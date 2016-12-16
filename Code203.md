# Remove Linked List Elements


```Java
	//beats 51.07%
	public ListNode removeElements(ListNode head, int val) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode iter=head;
        ListNode pre=pseudoHead;
        while(iter!=null){
            if(iter.val==val){
                pre.next=iter.next;
                iter=iter.next;
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
