# Partition List(快排中的partition的链表实现)

* 注意点：取出值小于指定值的节点，需要维护其前一个节点(pre)，而pre的维护与"iter是否与小于指定值的区间有关联"有关系

```Java
	//beats 5.35
	public ListNode partition(ListNode head, int x) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        ListNode smalltail=pseudoHead;
        ListNode iter=head;
        ListNode pre=pseudoHead;
        
        while(iter!=null){
            if(iter.val<x){
                //先取出该元素，并维护链表
                pre.next=iter.next;
                ListNode tempNext1=pre.next;//<Warn1>：pre.next可能在下面代码中会发生变动，因此这里需要保存一下以便更新iter

                //将iter插入到前面部分,并维护链表
                ListNode tempNext2=smalltail.next;
                smalltail.next=iter;
                iter.next=tempNext2;
                smalltail=iter;//<Warn2>：这里忘记更新了
                
                iter=tempNext1;
                
                //<Warn3>：当两部分分离时才不需要更新pre，否则需要更新pre
                if(iter==smalltail.next)
                    pre=smalltail;
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        return pseudoHead.next;
    }
    
    private void print(ListNode pseudoHead){
        ListNode iter=pseudoHead.next;
        System.out.print("begin: ");
        while(iter!=null){
            System.out.print(iter.val+"->");
            iter=iter.next;
        }
        System.out.println();
    }
```

* 更漂亮的写法
```Java
	public ListNode partition(ListNode head, int x) {
        ListNode pseudoHead=new ListNode(0);
        pseudoHead.next=head;
        
        ListNode i=pseudoHead;//对应于数组情况的索引i
        ListNode pre=pseudoHead;//当取出某节点时，需要将其前后节点连接起来，因此要用到前驱节点
        
        ListNode iter=head;
        while(iter!=null){
            if(iter.val<x){
                if(i!=pre){
                    pre.next=iter.next;
                    ListNode tempIterNext=iter.next;
                    ListNode temp_i_Next=i.next;
                    i.next=iter;
                    iter.next=temp_i_Next;
                    i=i.next;
                    iter=tempIterNext;
                }
                else{ //到目前为止，包括当前的iter节点，所有节点都移到了左边的区域，也就是i与pre是重合的，因此不需要交换操作
                    pre=iter;
                    i=i.next;
                    iter=iter.next;
                }
            }
            else{
                pre=iter;
                iter=iter.next;
            }
        }
        
        return pseudoHead.next;
    }
```

*　最简单的想法，不要对数组形式的partition产生思维定势
```Java
//beats 8.18%
public class Solution {
    public ListNode partition(ListNode head, int x) {
        ListNode smallPseudoHead=new ListNode(0);
        ListNode largePseudoHead=new ListNode(0);
        ListNode smallIter=smallPseudoHead;
        ListNode largeIter=largePseudoHead;
        ListNode iter=head;
        while(iter!=null){
            if(iter.val<x){
                smallIter.next=iter;
                smallIter=iter;
            }
            else{
                largeIter.next=iter;
                largeIter=iter;
            }
            iter=iter.next;
        }
        smallIter.next=largePseudoHead.next;
        largeIter.next=null;
        return smallPseudoHead.next;
    }
}
```