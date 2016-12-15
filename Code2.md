# Add Two Numbers

* ע��㣺��Ϊ�����֣���һ���֣��������ж�δ��ĩ�ˣ��ڶ����֣�ֻʣһ������δ��ĩ�ˣ��������֣��������Ľ�λ

```Java
	//beats 64.04%
	public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=pseudoHead;
        int carry=0;
        while(l1!=null&&l2!=null){
            int sum=carry+l1.val+l2.val;
            iter.next=new ListNode(sum%10);
            carry=sum/10;
            iter=iter.next;
            l1=l1.next;
            l2=l2.next;
        }
        while(l1!=null){
            int sum=carry+l1.val;
            iter.next=new ListNode(sum%10);
            carry=sum/10;
            iter=iter.next;
            l1=l1.next;
        }
        while(l2!=null){
            int sum=carry+l2.val;
            iter.next=new ListNode(sum%10);
            carry=sum/10;
            iter=iter.next;
            l2=l2.next;
        }
        if(carry!=0){
            iter.next=new ListNode(carry);
        }
        return pseudoHead.next;
    }
```