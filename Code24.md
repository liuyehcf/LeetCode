# Swap Nodes in Pairs

```Java
	//beats 22.11%
	public ListNode swapPairs(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;//<Warn3>���Ǻǣ�����©��
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
        
        //<Warn1>��������һ��Ԫ���䵥��������û����
        if(iter!=null){
            pre.next=iter;
        }else{
            pre.next=null;  //<Warn2>��û�䵥ʱ��Ҫ������һ��Ԫ��ָ����ȷ��null
        }
        
        return pseudoHead.next;
    }
```


```Java
//beats 2.72%
public class Solution {
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