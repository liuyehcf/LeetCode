#  Copy List with Random Pointer

```Java
	//beats 48.44%
	public RandomListNode copyRandomList(RandomListNode head) {
        RandomListNode pseudoHead=new RandomListNode(0);
        RandomListNode pseudoCopyHead=new RandomListNode(0);
        RandomListNode iter=head,iterCopy=pseudoCopyHead;
        
        Map<RandomListNode,RandomListNode> map=new HashMap<RandomListNode,RandomListNode>();
        while(iter!=null){
            RandomListNode newNode=new RandomListNode(iter.label);
            map.put(iter,newNode);
            iterCopy.next=newNode;
            iter=iter.next;
            iterCopy=iterCopy.next;
        }
        
        iter=head;
        iterCopy=pseudoCopyHead.next;
        while(iter!=null){
            RandomListNode originRandom=iter.random;
            RandomListNode copyRandom=map.get(originRandom);
            iterCopy.random=copyRandom;
            iter=iter.next;
            iterCopy=iterCopy.next;
        }
        
        return pseudoCopyHead.next;
    }
```