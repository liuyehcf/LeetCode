# Add Two Numbers II

* �Ƚ������뵽��˼·�����˶���Ŀռ�
```java
class Solution {
//beats 2.80%
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        List<Integer> num1=new ArrayList<Integer>();
        List<Integer> num2=new ArrayList<Integer>();
        
        while(l1!=null){
            num1.add(l1.val);
            l1=l1.next;
        }
        
        while(l2!=null){
            num2.add(l2.val);
            l2=l2.next;
        }
        
        int carry=0;
        
        int iter1=num1.size()-1;
        int iter2=num2.size()-1;
        
        ListNode pseudoHead=new ListNode(0);

        while(iter1>=0&&iter2>=0){
            int sum=num1.get(iter1)+num2.get(iter2)+carry;
            insert(pseudoHead,new ListNode(sum%10));
            carry=sum/10;
            iter1--;//<Warn>:miss this
            iter2--;//<Warn>:miss this
        }
        
        while(iter1>=0){
            int sum=num1.get(iter1)+carry;
            insert(pseudoHead,new ListNode(sum%10));
            carry=sum/10;
            iter1--;//<Warn>:miss this
        }
        
        while(iter2>=0){
            int sum=num2.get(iter2)+carry;
            insert(pseudoHead,new ListNode(sum%10));
            carry=sum/10;
            iter2--;//<Warn>:miss this
        }
        
        if(carry!=0){
            insert(pseudoHead,new ListNode(carry));
        }
        
        return pseudoHead.next;
    }
    
    private void insert(ListNode pseudoHead,ListNode node){
        ListNode tempNext=pseudoHead.next;
        pseudoHead.next=node;
        node.next=tempNext;
   }
}
```


```java
class Solution {
public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        LinkedList<Integer> stack1=new LinkedList<Integer>();
        LinkedList<Integer> stack2=new LinkedList<Integer>();
        
        while(l1!=null){
            stack1.push(l1.val);
            l1=l1.next;
        }
        
        while(l2!=null){
            stack2.push(l2.val);
            l2=l2.next;
        }
        
        ListNode pseudoHead=new ListNode(0);
        int carry=0;
        while(!stack1.isEmpty()||!stack2.isEmpty()){
            int sum=carry;
            if(!stack1.isEmpty()) sum+=stack1.pop();
            if(!stack2.isEmpty()) sum+=stack2.pop();
            insert(pseudoHead,new ListNode(sum%10));
            carry=sum/10;
        }
        
        if(carry!=0){
            insert(pseudoHead,new ListNode(carry));
        }
        return pseudoHead.next;
    }
    
    private void insert(ListNode pseudoHead,ListNode node){
        ListNode tempNext=pseudoHead.next;
        pseudoHead.next=node;
        node.next=tempNext;
   }
}
```

* ȡ���������ã������˵�
```java
class Solution {
//beats 60%
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        LinkedList<Integer> stack1=new LinkedList<Integer>();
        LinkedList<Integer> stack2=new LinkedList<Integer>();
        
        while(l1!=null){
            stack1.push(l1.val);
            l1=l1.next;
        }
        
        while(l2!=null){
            stack2.push(l2.val);
            l2=l2.next;
        }
        
        ListNode head=null;
        int carry=0;
        while(!stack1.isEmpty()||!stack2.isEmpty()){
            int sum=carry;
            if(!stack1.isEmpty()) sum+=stack1.pop();
            if(!stack2.isEmpty()) sum+=stack2.pop();
            ListNode node=new ListNode(sum%10);
            node.next=head;
            head=node;
            carry=sum/10;
            
        }
        
        if(carry!=0){
            ListNode node=new ListNode(carry);
            node.next=head;
            head=node;
        }
        return head;
   }
}
```