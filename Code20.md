# Valid Parentheses

```java
class Solution {
    public boolean isValid(String s) {
        LinkedList<Character> stack = new LinkedList<>();

        for (char c : s.toCharArray()) {
            if (c == '(' || c == '[' || c == '{') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) {
                    return false;
                }

                char c2 = stack.pop();

                if (!(c == ')' && c2 == '('
                        || c == ']' && c2 == '['
                        || c == '}' && c2 == '{')) {
                    return false;
                }
            }
        }

        return stack.isEmpty();
    }
}
```