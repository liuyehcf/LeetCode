# Linked List Cycle

```Java
	public boolean hasCycle(ListNode head) {
        ListNode slow=head,fast=head;
        boolean flag=false;//<Warn>:需要有一个标记来注明是否处于开始，起步时相遇自然是要排除的
        while(fast!=null&&fast.next!=null){
            if(fast==slow&&flag) return true;
            fast=fast.next.next;
            slow=slow.next;
            flag=true;
        }
        return false;
    }
```

* 换种思路，错开起始位置即可
```Java
	//beats 9.95%
	public boolean hasCycle(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode slow=pseudoHead,fast=head;
        while(fast!=null&&fast.next!=null){
            if(fast==slow) return true;
            fast=fast.next.next;
            slow=slow.next;
        }
        return false;
    }
```