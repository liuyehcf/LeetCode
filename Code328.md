# Odd Even Linked List

```Java
	public ListNode oddEvenList(ListNode head) {
        ListNode oddPseudoHead=new ListNode(0);
        ListNode evenPseudoHead=new ListNode(0);
        ListNode iterOdd=oddPseudoHead;
        ListNode iterEven=evenPseudoHead;
        
        ListNode iter=head;
        boolean isOdd=true;
        while(iter!=null){
            if(isOdd){
                iterOdd.next=iter;
                iterOdd=iterOdd.next;
            }else{
                iterEven.next=iter;
                iterEven=iterEven.next;
            }
            isOdd=!isOdd;
            iter=iter.next;
        }
        iterOdd.next=evenPseudoHead.next;
        iterEven.next=null;
        return oddPseudoHead.next;
    }
```