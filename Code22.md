# Generate Parentheses

```java
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> res = new ArrayList<>();

        StringBuilder sb = new StringBuilder();

        generateParenthesis(res, sb, 0, 0, n);

        return res;
    }

    private void generateParenthesis(List<String> res, StringBuilder sb,
                                     int leftNum, int rightNum, int limit) {
        if (rightNum == limit) {
            res.add(sb.toString());
        } else if (leftNum == limit) {
            sb.append(')');
            generateParenthesis(res, sb, leftNum, rightNum + 1, limit);
            sb.setLength(sb.length() - 1);
        } else if (leftNum == rightNum) {
            sb.append('(');
            generateParenthesis(res, sb, leftNum + 1, rightNum, limit);
            sb.setLength(sb.length() - 1);
        } else {
            sb.append('(');
            generateParenthesis(res, sb, leftNum + 1, rightNum, limit);
            sb.setLength(sb.length() - 1);

            sb.append(')');
            generateParenthesis(res, sb, leftNum, rightNum + 1, limit);
            sb.setLength(sb.length() - 1);
        }
    }
}
```