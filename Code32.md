# Longest Valid Parentheses

## dp

```java
class Solution {
    public int longestValidParentheses(String s) {
        int[] dp = new int[s.length()];

        int max = 0;

        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) == '(') {
                continue;
            }

            int left = i - dp[i - 1] - 1;

            if (left >= 0 && s.charAt(left) == '(') {
                dp[i] = dp[i - 1] + 2;

                if (left - 1 >= 0) {
                    dp[i] += dp[left - 1];
                }
            }


            max = Math.max(max, dp[i]);
        }

        return max;
    }
}
```

## stack

```java
class Solution {
    public int longestValidParentheses(String s) {
        LinkedList<Integer> stack = new LinkedList<>();

        int max = 0;

        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '(') {
                stack.push(i);
            } else {
                if (!stack.isEmpty()) {
                    // find a match
                    if (s.charAt(stack.peek()) == '(') {
                        stack.pop();
                    } else {
                        stack.push(i);
                    }
                } else {
                    stack.push(i);
                }
            }
        }

        // now stack contains the indices of characters which cannot be matched

        if (stack.isEmpty()) {
            max = s.length();
        } else {
            int right = s.length();

            while (!stack.isEmpty()) {
                int left = stack.pop();

                // [left+1, right) is matched
                max = Math.max(max, right - (left + 1));

                right = left;
            }

            // [0, right) is matched
            max = Math.max(max, right);
        }
        return max;
    }
}
```