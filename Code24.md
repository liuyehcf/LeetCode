# Swap Nodes in Pairs

```Java
	//beats 3.43%
	public ListNode swapPairs(ListNode head) {
        ListNode leftPseudoHead=new ListNode(0);
        ListNode rightPseudoHead=new ListNode(0);
        boolean odd=true;
        ListNode iter=head,iter1=leftPseudoHead,iter2=rightPseudoHead;
        while(iter!=null){
            if(odd){
                iter1.next=iter;
                iter1=iter1.next;
                iter=iter.next;
            }else{
                iter2.next=iter;
                iter2=iter2.next;
                iter=iter.next;
            }
            odd=!odd;
        }
        iter1.next=null;
        iter2.next=null;
        
        ListNode pseudoHead=new ListNode(0);
        iter=pseudoHead;  <Warn2>��������һ��
        iter1=leftPseudoHead.next;
        iter2=rightPseudoHead.next;
        odd=false;
        while(iter1!=null&&iter2!=null){
            if(odd){
                iter.next=iter1;
                iter1=iter1.next;
                iter=iter.next;
            }else{
                iter.next=iter2;
                iter2=iter2.next;
                iter=iter.next;
            }
            odd=!odd;
        }
        if(iter1!=null){
            iter.next=iter1;
        }
        else if(iter2!=null){  //<Warn1>:�����ʼд����else
            iter.next=iter2;
        }
        return pseudoHead.next;
    }
```


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
        
        //<Warn1>�������һ��Ԫ���䵥�������û����
        if(iter!=null){
            pre.next=iter;
        }else{
            pre.next=null;  //<Warn2>��û�䵥ʱ��Ҫ�����һ��Ԫ��ָ����ȷ��null
        }
        
        return pseudoHead.next;
    }
```