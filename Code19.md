# Remove Nth Node From End of List(除去单向链表中倒数第n个数(从n从1开始计))

* 链表长为L，除去倒数第n个数，就是除去正数第L+1-n个数

```Java
	//beats 79.77%
	public ListNode removeNthFromEnd(ListNode head, int n) {
        int len=0;
        ListNode iter=head;
        while(iter!=null){
            iter=iter.next;
            len++;
        }
        int m=len+1-n;
        
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        int cnt=0;
        iter=pseudoHead;
        ListNode preNode=null,nextNode=null;
        while(iter!=null){
            if(cnt==m-1){
                preNode=iter;
                nextNode=iter.next.next;
                break;
            }
            cnt++;
            iter=iter.next;
        }
        preNode.next=nextNode;
        return pseudoHead.next;
    }
```