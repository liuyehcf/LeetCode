# Merge Two Sorted Lists(�����ڹ鲢�����е�merge)

* ���������һ���ڱ����������ڷֳ����������������ж�Ϊ��ĩ�ˣ�������һ�����е�ĩ��

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