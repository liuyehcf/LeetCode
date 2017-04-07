# Find Median from Data Stream

* 两个优先队列,但是如何保证两个优先队列不重合，且长度相等
```Java
//beats 76.58%
public class MedianFinder {

    /** initialize your data structure here. */
    private Queue<Integer> smallQueue;
    private Queue<Integer> largeQueue;
     
    public MedianFinder() {
        smallQueue=new PriorityQueue<Integer>();
        largeQueue=new PriorityQueue<Integer>(
            new Comparator<Integer>(){
                @Override
                public int compare(Integer obj1,Integer obj2){
                    return obj2-obj1;
                }
            }
        );
    }
    
    public void addNum(int num) {
        if(smallQueue.isEmpty()||num>=smallQueue.peek()){
            smallQueue.offer(num);
        }
        else{
            largeQueue.offer(num);
        }
        
        if(smallQueue.size()>largeQueue.size()+1){
            largeQueue.offer(smallQueue.poll());
        }
        else if(largeQueue.size()>smallQueue.size()){
            smallQueue.offer(largeQueue.poll());
        }
    }
    
    public double findMedian() {
        if(smallQueue.size()==largeQueue.size()){
            return ((double)smallQueue.peek()+(double)largeQueue.peek())/2;
        }else{
            return smallQueue.peek();
        }
    }
}
```

* 更优雅的添加方式
```Java
public class MedianFinder {

    /** initialize your data structure here. */
    private Queue<Integer> smallQueue;
    private Queue<Integer> largeQueue;
     
    public MedianFinder() {
        smallQueue=new PriorityQueue<Integer>();
        largeQueue=new PriorityQueue<Integer>(
            new Comparator<Integer>(){
                @Override
                public int compare(Integer obj1,Integer obj2){
                    return obj2-obj1;
                }
            }
        );
    }
    
    public void addNum(int num) {
        smallQueue.offer(num);
        largeQueue.offer(smallQueue.poll());
        
        if(largeQueue.size()>smallQueue.size()){
            smallQueue.offer(largeQueue.poll());
        }
    }
    
    public double findMedian() {
        if(smallQueue.size()==largeQueue.size()){
            return ((double)smallQueue.peek()+(double)largeQueue.peek())/2;
        }else{
            return smallQueue.peek();
        }
    }
}
```