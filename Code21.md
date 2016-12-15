# Merge Two Sorted Lists(类似于归并排序中的merge)

* 相对于设置一个哨兵，我倾向于分成两步：当两个序列都为到末端，当其中一个序列到末端

```Java
	//beats 25.68%
	public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=pseudoHead,iter1=l1,iter2=l2;
        while(iter1!=null&&iter2!=null){
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
        while(iter1!=null){
            iter.next=iter1;
            iter1=iter1.next;
            iter=iter.next;
        }
        while(iter2!=null){
            iter.next=iter2;
            iter2=iter2.next;
            iter=iter.next;
        }
        return pseudoHead.next;
    }
```