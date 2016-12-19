# Palindrome Linked List

```Java
	//beats 37.13%
	public boolean isPalindrome(ListNode head) {
        if(head==null) return true;
        ListNode slow=head,fast=head;
        while(fast.next!=null&&fast.next.next!=null){
            fast=fast.next.next;
            slow=slow.next;
        }
        reverse(slow,null);
        
        ListNode iter1=head,iter2=slow.next;
        while(iter2!=null){
            if(iter1.val!=iter2.val) return false;
            iter1=iter1.next;
            iter2=iter2.next;
        }
        return true;
    }
    
    private void reverse(ListNode pseudoHead,ListNode tail){
        ListNode iter=pseudoHead.next;
        pseudoHead.next=tail;
        while(iter!=tail){
            ListNode tempIterNext=iter.next;
            ListNode temppseudoHeadNext=pseudoHead.next;
            pseudoHead.next=iter;
            iter.next=temppseudoHeadNext;
            iter=tempIterNext;
        }
    }
```