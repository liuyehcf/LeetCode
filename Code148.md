# Sort List

* �鲢���򣬱Ƚ���
```Java
    //beats 2.19%
    public ListNode sortList(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        sort(pseudoHead,null);
        return pseudoHead.next;
    }
    
    private void sort(ListNode pseudoHead,ListNode tail){
        
        if(pseudoHead.next==tail||pseudoHead.next.next==tail) return;
        ListNode slow=pseudoHead.next,fast=pseudoHead.next;
        while(fast.next!=tail&&fast.next.next!=tail){//<Warn1&2>:��һ�ְ�tailд����null���ڶ��������ԣ��ʼд����fast!=tail&&fast.next!=tail�������ᵼ�³���Ϊ2����������ѭ��
            fast=fast.next.next;
            slow=slow.next;
        }
        sort(pseudoHead,slow.next);
        sort(slow,tail);
        pseudoHead.next=merge(pseudoHead,slow.next,slow,tail);
    }
    
    private ListNode merge(ListNode pseudoHead1,ListNode tail1,ListNode pseudoHead2,ListNode tail2){
        ListNode iter1=pseudoHead1.next;
        ListNode iter2=pseudoHead2.next;
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=pseudoHead;
        while(iter1!=tail1&&iter2!=tail2){
            if(iter1.val<=iter2.val){
                iter.next=iter1;
                iter1=iter1.next;
                iter=iter.next;
            }
            else{
                iter.next=iter2;
                iter2=iter2.next;
                iter=iter.next;
            }
        }
        while(iter1!=tail1){
            iter.next=iter1;
            iter1=iter1.next;
            iter=iter.next;
        }
        while(iter2!=tail2){
            iter.next=iter2;
            iter2=iter2.next;
            iter=iter.next;
        }
        iter.next=tail2;
        return pseudoHead.next;
    }
```


* ����������ʱ���������ʱ���������򷴶���Ƚ���???
```Java
    public ListNode sortList(ListNode head) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        sort(pseudoHead,null);
        return pseudoHead.next;
    }
    
    private void sort(ListNode pseudoHead,ListNode tail){
        if(pseudoHead.next==tail||pseudoHead.next.next==tail) return;
        ListNode q=partition(pseudoHead,tail);
        sort(pseudoHead,q);
        sort(q,tail);
    }
    
    private ListNode partition(ListNode pseudoHead,ListNode tail){
        ListNode first=pseudoHead.next;
        int x=first.val;
        pseudoHead.next=pseudoHead.next.next;
        ListNode iter=pseudoHead.next;
        ListNode pre=pseudoHead;
        ListNode i=pseudoHead;
        while(iter!=tail){
            if(iter.val<x){
                if(i!=pre){
                    pre.next=iter.next;
                    ListNode tempNext=iter.next;
                    ListNode tempiNext=i.next;
                    i.next=iter;
                    iter.next=tempiNext;
                    iter=tempNext;
                    i=i.next;
                }
                else{
                    pre=iter;
                    iter=iter.next;
                    i=i.next;
                }
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        
        
        ListNode tempiNext=i.next;
        i.next=first;
        first.next=tempiNext;
        return first;
    }
    
    private ListNode partition(ListNode pseudoHead,ListNode tail){
        ListNode x=pseudoHead.next;
        ListNode i=pseudoHead;
        ListNode j=pseudoHead.next.next;
        ListNode iter=pseudoHead;
        
        while(j!=tail){
            if(j.val<x.val){
                if(i==iter){
                    iter.next=j;
                    j=j.next;
                    iter=iter.next;
                    i=i.next;
                }
                else{
                    ListNode iNext=i.next;
                    ListNode jNext=j.next;
                    i.next=j;
                    j.next=iNext;
                    j=jNext;
                    i=i.next;
                }
            }
            else{
                iter.next=j;
                iter=iter.next;
                j=j.next;
            }
        }
        
        ListNode iNext=i.next;
        i.next=x;
        x.next=iNext;
        if(iter==i){
            x.next=tail;
        }
        else{
            iter.next=tail;
        }
        return x;
    }
```