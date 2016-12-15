# Reverse Nodes in k-Group

```Java
	//beats 10.07%
	public ListNode reverseKGroup(ListNode head, int k) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode iter=pseudoHead.next;
        ListNode pre=pseudoHead;
        int cnt=0;
        while(iter!=null){
            if(++cnt==k){
                ListNode tail=iter.next;
                ListNode tempPre=pre.next;
                reverse(pre,tail);
                cnt=0;
                pre=tempPre;
                iter=tail;//<Warn1>：本来没有这句，下面的else也没有
            }
            else{
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
    
    private void reverse(ListNode pseudoHead,ListNode tail){
        ListNode iter=pseudoHead.next;
        pseudoHead.next=tail;
        while(iter!=tail){
            ListNode tempNext=iter.next;
            iter.next=pseudoHead.next;
            pseudoHead.next=iter;
            iter=tempNext;
        }
    }
```