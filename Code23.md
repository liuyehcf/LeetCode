# Merge k Sorted Lists

```java
class Solution {
//超时
    public ListNode mergeKLists(ListNode[] lists) {
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=pseudoHead;
        ListNode cur=null;
        while((cur=top(lists))!=null){
            iter.next=cur;
            iter=iter.next;
        }
        return pseudoHead.next;
    }
    
    private ListNode top(ListNode[] iters){
        int index=-1;
        for(int i=0;i<iters.length;i++){
            if(iters[i]==null) continue;
            if(index==-1) index=i;
            else if(iters[i].val<iters[index].val) index=i;
        }
        ListNode res=null;
        if(index!=-1) {
            res=iters[index];
            iters[index]=iters[index].next;
        }
        return res;
   }
}
```


```java
class Solution {
//beats 27.70%
    public ListNode mergeKLists(ListNode[] lists) {
        ListNode pseudoHead=new ListNode(0);
        ListNode iter=pseudoHead;
        Queue<ListNode> queue=new PriorityQueue<ListNode>(new Comparator<ListNode>(){
            @Override
            public int compare(ListNode obj1,ListNode obj2){
                return obj1.val-obj2.val;
            }
        });
        
        for(ListNode list:lists){
            if(list!=null){
                queue.offer(list);
            }
        }
        
        while(!queue.isEmpty()){
            ListNode peek=queue.poll();
            iter.next=peek;
            if(peek.next!=null) queue.offer(peek.next);
            iter=iter.next;
        }
        return pseudoHead.next;
   }
}
```