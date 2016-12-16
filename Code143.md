# Reorder List


```Java
	//beats 10.44%
	public void reorderList(ListNode head) {
        List<ListNode> list=new ArrayList<ListNode>();
        ListNode iter=head;
        while(iter!=null){
            list.add(iter);
            iter=iter.next;
        }
        
        ListNode pseudoHead=new ListNode(0);
        iter=pseudoHead;
        int left=0,right=list.size()-1;
        boolean flag=true;
        while(left<right){
            if(flag) iter.next=list.get(left++);
            else iter.next=list.get(right--);
            iter=iter.next;
            flag=!flag;
        }
        if(left==right){
            iter.next=list.get(left);
            iter=iter.next;
        }
        iter.next=null;
    }
```