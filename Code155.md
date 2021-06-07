# Min Stack

```java
class MinStack {

    private LinkedList<Node> stack = new LinkedList<>();

    /**
     * initialize your data structure here.
     */
    public MinStack() {

    }

    public void push(int val) {
        if (stack.isEmpty()) {
            stack.push(new Node(val, val));
        } else {
            stack.push(new Node(val, Math.min(val, getMin())));
        }
    }

    public void pop() {
        stack.pop();
    }

    public int top() {
        return stack.peek().val;
    }

    public int getMin() {
        return stack.peek().minVal;
    }

    private static final class Node {
        private int val;
        private int minVal;

        private Node(int val, int minVal) {
            this.val = val;
            this.minVal = minVal;
        }
    }
}
```