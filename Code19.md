# Remove Nth Node From End of List(除去单向链表中倒数第n个数(从n从1开始计))

* 链表长为L，除去倒数第n个数，就是除去正数第L+1-n个数

```Java
    //beats 79.77%
public class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode iter=head;
        int cnt=0;
        while(iter!=null){
            cnt++;
            iter=iter.next;
        }
        
        int m=cnt+1-n;
        
        iter=head;
        ListNode pre=pseudoHead;
        cnt=0;
        while(iter!=null){
            if(++cnt==m){
                pre.next=iter.next;
                break;
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
}
```

* 只遍历一遍的做法
```Java
public class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode fast=head;

        for(int i=0;i<n;i++){
            fast=fast.next;
        }
        
        ListNode slow=pseudoHead;
        
        while(fast!=null){
            fast=fast.next;
            slow=slow.next;
        }
        
        slow.next=slow.next.next;
        return pseudoHead.next;
    }
}
```