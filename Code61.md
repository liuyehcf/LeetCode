# Rotate List

```Java
	//beats 64.57%
	public ListNode rotateRight(ListNode head, int k) {
        if(k==0||head==null) return head;
        int len=0;
        ListNode iter=head;
        while(iter!=null){
            len++;
            iter=iter.next;
        }
        k=k%len;
        if(k==0) return head;
        int n=len+1-k;
        
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        iter=pseudoHead;
        int cnt=0;
        ListNode newHead=null;
        while(iter!=null){
            if(cnt==n-1){
                newHead=iter.next;
                iter.next=null;
                break;
            }
            cnt++;
            iter=iter.next;
        }
        
        iter=newHead;
        while(iter!=null){
            if(iter.next==null) break;
            iter=iter.next;
        }
        iter.next=pseudoHead.next;
        return newHead;
    }
```