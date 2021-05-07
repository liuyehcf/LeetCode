# Intersection of Two Linked Lists

```Java
    //beats 39.40%
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        ListNode iter1=headA,iter2=headB;
        int len1=0,len2=0;
        while(iter1!=null){
            len1++;
            iter1=iter1.next;
        }
        while(iter2!=null){
            len2++;
            iter2=iter2.next;
        }
        iter1=headA;
        iter2=headB;
        if(len1<len2){
            while(len2>len1){
                iter2=iter2.next;
                len2--;
            }
        }
        else if(len2<len1){
            while(len1>len2){
                iter1=iter1.next;
                len1--;
            }
        }
        while(iter1!=null&&iter2!=null){
            if(iter1==iter2) return iter1;
            iter1=iter1.next;
            iter2=iter2.next;
        }
        return null;
    }
```