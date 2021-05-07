# Reverse Linked List II

```Java
    //beats 14.82%
    public ListNode reverseBetween(ListNode head, int m, int n) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        int cnt=0;
        ListNode iter=pseudoHead,left=null,right=null;//<Warn1>��iter����س�ʼ������head����Ҫ˼ά��ʽ������
        while(iter!=null){
            if(cnt==m-1) left=iter;
            if(cnt==n+1) right=iter;
            cnt++;
            iter=iter.next;
        }
        reverse(left,right);
        return pseudoHead.next;
    }
    
    private void reverse(ListNode pseudoHead,ListNode tail){
        ListNode iter=pseudoHead.next;
        pseudoHead.next=tail;
        while(iter!=tail){//<Warn2>������д����iter!=null
            ListNode tempPseudoHeadNext=pseudoHead.next;
            ListNode tempIterNext=iter.next;
            pseudoHead.next=iter;
            iter.next=tempPseudoHeadNext;
            iter=tempIterNext;
        }
    }
```