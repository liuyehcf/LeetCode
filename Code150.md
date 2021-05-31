# Evaluate Reverse Polish Notation

```java
class Solution {
    public int evalRPN(String[] tokens) {
        LinkedList<Integer> stack = new LinkedList<>();

        for (String token : tokens) {
            if ("*".equals(token)) {
                int value2 = stack.pop();
                int value1 = stack.pop();

                stack.push(value1 * value2);
            } else if ("/".equals(token)) {
                int value2 = stack.pop();
                int value1 = stack.pop();

                stack.push(value1 / value2);
            } else if ("+".equals(token)) {
                int value2 = stack.pop();
                int value1 = stack.pop();

                stack.push(value1 + value2);
            } else if ("-".equals(token)) {
                int value2 = stack.pop();
                int value1 = stack.pop();

                stack.push(value1 - value2);
            } else {
                stack.push(Integer.parseInt(token));
            }
        }

        return stack.peek();
    }
}
```