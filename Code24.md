# Swap Nodes in Pairs

```java
class Solution {
//beats 22.11%
    public ListNode swapPairs(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;//<Warn3>锟斤拷锟角呵ｏ拷锟斤拷锟斤拷漏锟斤拷
        ListNode iter=pseudoHead.next;
        ListNode pre=pseudoHead;
        while(iter!=null&&iter.next!=null){
            ListNode left=iter,right=iter.next,next=iter.next.next;
            pre.next=right;
            right.next=left;
            left.next=next;
            iter=next;
            pre=left;
        }
        
        //<Warn1>锟斤拷锟斤拷锟斤拷锟斤拷一锟斤拷元锟斤拷锟戒单锟斤拷锟斤拷锟斤拷锟斤拷没锟斤拷锟斤拷
        if(iter!=null){
            pre.next=iter;
        }else{
            pre.next=null;  //<Warn2>锟斤拷没锟戒单时锟斤拷要锟斤拷锟斤拷锟斤拷一锟斤拷元锟斤拷指锟斤拷锟斤拷确锟斤拷null
        }
        
        return pseudoHead.next;
   }
}
```


```java
//beats 2.72%
class Solution {
    public ListNode swapPairs(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode left=pseudoHead;
        if(head==null||head.next==null) return head;
        ListNode right=head.next.next;
        
        while(true){
            swap(left,right);
            left=left.next.next;
            if(right==null||right.next==null) break;
            right=right.next.next;
        }
        
        return pseudoHead.next;
    }
    
    private void swap(ListNode pseudoHead,ListNode tail){
        ListNode first=pseudoHead.next;
        ListNode second=first.next;
        pseudoHead.next=second;
        second.next=first;
        first.next=tail;
    }
}
```