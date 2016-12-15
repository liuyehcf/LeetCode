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
        iter=pseudoHead;  <Warn2>：少了这一句
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
        else if(iter2!=null){  //<Warn1>:这里最开始写成了else
            iter.next=iter2;
        }
        return pseudoHead.next;
    }
```


```Java
	//beats 22.11%
	public ListNode swapPairs(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;//<Warn3>：呵呵，这里漏了
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
        
        //<Warn1>：当最后一个元素落单的情况，没考虑
        if(iter!=null){
            pre.next=iter;
        }else{
            pre.next=null;  //<Warn2>：没落单时，要将最后一个元素指向正确的null
        }
        
        return pseudoHead.next;
    }
```