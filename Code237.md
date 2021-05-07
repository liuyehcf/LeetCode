# Delete Node in a Linked List

```Java
    //beats 5.56%
    public void deleteNode(ListNode node) {
        ListNode iter=node;
        ListNode pre=null;
        while(iter!=null&&iter.next!=null){
            pre=iter;
            iter.val=iter.next.val;
            iter=iter.next;
        }
        pre.next=null;
    }
```