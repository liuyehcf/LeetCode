# Implement Queue using Stacks

```java
//beats 25.79%
public class MyQueue {
    
    LinkedList<Integer> stack=null;
    LinkedList<Integer> stackAux=null;

    /** Initialize your data structure here. */
    public MyQueue() {
        stack=new LinkedList<Integer>();
        stackAux=new LinkedList<Integer>();
    }
    
    /** Push element x to the back of queue. */
    public void push(int x) {
        while(!stack.isEmpty()){
            stackAux.push(stack.pop());
        }
        stack.push(x);
        while(!stackAux.isEmpty()){
            stack.push(stackAux.pop());
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    public int pop() {
        return stack.pop();
    }
    
    /** Get the front element. */
    public int peek() {
        return stack.peek();
    }
    
    /** Returns whether the queue is empty. */
    public boolean empty() {
        return stack.isEmpty();
    }
}
```