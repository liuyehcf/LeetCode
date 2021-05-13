# Basic Calculator

```java
class Solution {
    public int calculate(String s) {
        LinkedList<Integer> sumStack = new LinkedList<>();
        LinkedList<Character> operatorStack = new LinkedList<>();

        char operator = '+';

        int sum = 0;

        int i = 0;
        while (i < s.length()) {
            if (s.charAt(i) == ' ') {
                // do nothing
            } else if (s.charAt(i) >= '0' && s.charAt(i) <= '9') {
                StringBuilder sb = new StringBuilder();
                while (i < s.length() && s.charAt(i) >= '0' && s.charAt(i) <= '9') {
                    sb.append(s.charAt(i++));
                }
                i--;

                int val = Integer.valueOf(sb.toString());

                sum = calculate(sum, val, operator);
            } else if (s.charAt(i) == '-') {
                operator = '-';
            } else if (s.charAt(i) == '+') {
                operator = '+';
            } else if (s.charAt(i) == '(') {
                sumStack.push(sum);
                operatorStack.push(operator);

                sum = 0;
                operator = '+';
            } else if (s.charAt(i) == ')') {
                int preSum = sumStack.pop();
                char preOperator = operatorStack.pop();

                preSum = calculate(preSum, sum, preOperator);

                sum = preSum;
            }

            i++;
        }

        return sum;
    }

    private int calculate(int sum, int val, char operator) {
        if (operator == '+') {
            sum += val;
        } else {
            sum -= val;
        }

        return sum;
    }
}
```