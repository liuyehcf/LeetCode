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
                iter=tail;
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

* brilliant solution
```Java
//beats 57.16%
public class Solution {
    public ListNode reverseKGroup(ListNode head, int k) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode left=pseudoHead;
        ListNode right=head;
        
        int cnt=0;
        while(right!=null&&cnt<k){
            right=right.next;
            cnt++;
        }
        if(cnt!=k) return head;
        
        while(true){
            reverse(left,right);
            cnt=0;
            while(right!=null&&cnt<k){
                left=left.next;
                right=right.next;
                cnt++;
            }
            if(cnt!=k) break;
        }
        return pseudoHead.next;
    }
    
    private void reverse(ListNode pseudoHead,ListNode tail){
        ListNode iter=pseudoHead.next;
        pseudoHead.next=tail;
        while(iter!=tail){
            ListNode iterNext=iter.next;
            ListNode pseudoHeadNext=pseudoHead.next;
            pseudoHead.next=iter;
            iter.next=pseudoHeadNext;
            iter=iterNext;
        }
    }
}
```