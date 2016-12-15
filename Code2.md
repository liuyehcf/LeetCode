# Add Two Numbers

* 注意点：分为三部分，第一部分：两个序列都未到末端；第二部分：只剩一个序列未到末端；第三部分：处理最后的进位

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