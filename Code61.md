# Rotate List

```Java
    //beats 64.57%
    public ListNode rotateRight(ListNode head, int k) {
        if(k==0||head==null) return head;
        int len=0;
        ListNode iter=head;
        while(iter!=null){
            len++;
            iter=iter.next;
        }
        k=k%len;
        if(k==0) return head;
        int n=len+1-k;
        
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        iter=pseudoHead;
        int cnt=0;
        ListNode newHead=null;
        while(iter!=null){
            if(cnt==n-1){
                newHead=iter.next;
                iter.next=null;
                break;
            }
            cnt++;
            iter=iter.next;
        }
        
        iter=newHead;
        while(iter!=null){
            if(iter.next==null) break;
            iter=iter.next;
        }
        iter.next=pseudoHead.next;
        return newHead;
    }
```


```Java
    //beats 45.86%
    public ListNode rotateRight(ListNode head, int k) {
        if(head==null) return head;
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        int len=0;
        ListNode iter=head;
        ListNode preTail=null;
        while(iter!=null){
            len++;
            preTail=iter;
            iter=iter.next;
        }
        k=k%len;
        if(k==0) return head;
        for(int i=0;i<len-k;i++){
            preTail=rotateOneStep(pseudoHead,preTail);
        }
        return pseudoHead.next;
    }
    
    private ListNode rotateOneStep(ListNode pseudoHead,ListNode preTail){
        ListNode second=pseudoHead.next.next;
        ListNode first=pseudoHead.next;
        pseudoHead.next=second;
        preTail.next=first;
        first.next=null;
        return first;
    }
```


```Java
//beats 78.60%
public class Solution {
    public ListNode rotateRight(ListNode head, int k) {
        if(head==null) return null;
        
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode iter=head;
        
        int length=0;
        while(iter!=null){
            iter=iter.next;
            length++;
        }
        k%=length;
        if(k==0) return head;
        k=length-k;
        int cnt=0;
        iter=pseudoHead;
        while(cnt<k){
            iter=iter.next;
            cnt++;
        }
        ListNode left=pseudoHead.next;//非常关键
        reverse(pseudoHead,iter.next);
        reverse(left,null);
        reverse(pseudoHead,null);
        
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

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode rotateRight(ListNode head, int k) {
        ListNode pseudoHead=new ListNode();
        pseudoHead.next=head;
        
        int cnt=0;
        ListNode iter=head;
        
        while(iter!=null){
            cnt++;
            iter=iter.next;
        }
        
        int length=cnt;
        if(length==0) {
            return pseudoHead.next;
        }
        
        k=k%length;
        if(k==0){
            return pseudoHead.next;
        }
        
        int leftLength=length-k;
        int rightLength=length-leftLength;
        
        ListNode firstNodeOfLeftPart=pseudoHead.next;
        ListNode lastNodeOfLeftPart=null;
        
        ListNode firstNodeOfRightPart=null;
        ListNode lastNodeOfRightPart=null;
        
        iter=pseudoHead;
        cnt=0;
        
        while(cnt<leftLength){
            cnt++;
            iter=iter.next;
        }
        lastNodeOfLeftPart=iter;
        firstNodeOfRightPart=iter.next;
        
        cnt=0;
        while(cnt<rightLength){
            cnt++;
            iter=iter.next;
        }
        lastNodeOfRightPart=iter;
        
        pseudoHead.next=firstNodeOfRightPart;
        lastNodeOfRightPart.next=firstNodeOfLeftPart;
        lastNodeOfLeftPart.next=null;
        
        return pseudoHead.next;
    }
}
```