# Sliding Window Maximum

```java
//beats 17.10%
class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if(nums==null||nums.length==0||k>nums.length) return new int[0];
        int[] res=new int[nums.length-k+1];
        
        Queue<Integer> queue=new PriorityQueue<Integer>(Collections.<Integer>reverseOrder());
        
        for(int i=0;i<k;i++) queue.offer(nums[i]);
        int iter=0;
        res[iter++]=queue.peek();
        
        for(int i=k;i<nums.length;i++){
            queue.remove(nums[i-k]);
            queue.offer(nums[i]);
            res[iter++]=queue.peek();
        }
        return res;
    }
}
```


```java
//beats 87.88%
class Solution {
    public int[] maxSlidingWindow(int[] nums, int k) {
        if(nums==null||nums.length==0||k>nums.length) return new int[0];
        
        LinkedList<Integer> deque=new LinkedList<Integer>();
        
        int[] res=new int[nums.length-k+1];
        int iter=0;
        
        for(int i=0;i<nums.length;i++){
            while(!deque.isEmpty()&&nums[i]>nums[deque.getLast()]){
                deque.removeLast();
            }
            
            deque.addLast(i);
            
            if(deque.getFirst()<=i-k) deque.removeFirst();
            
            if(i>=k-1) res[iter++]=nums[deque.getFirst()];
        }
        return res;
    }
}
```