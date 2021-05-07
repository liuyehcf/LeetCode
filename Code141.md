# Linked List Cycle

```java
class Solution {
public boolean hasCycle(ListNode head) {
        ListNode slow=head,fast=head;
        boolean flag=false;//<Warn>:��Ҫ��һ�������ע���Ƿ��ڿ�ʼ����ʱ������Ȼ��Ҫ�ų���
        while(fast!=null&&fast.next!=null){
            if(fast==slow&&flag) return true;
            fast=fast.next.next;
            slow=slow.next;
            flag=true;
        }
        return false;
   }
}
```

* ����˼·��������ʼλ�ü���
```java
class Solution {
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
}
```