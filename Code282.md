# Expression Add Operators


```java
class Solution {
    public List<String> addOperators(String num, int target) {
        List<String> res = new ArrayList<>();

        addOperators(num, 0, target, 0, 0, res, new StringBuilder());

        return res;
    }

    private void addOperators(String num, int index, int target,
                              int sum, int pre,
                              List<String> res, StringBuilder sb) {
        if (index == num.length()) {
            if (sum + pre == target) {
                res.add(sb.toString());
            }
            return;
        }

        int originalLen = sb.length();

        int lenMax = 10;
        if (num.charAt(index) == '0') {
            lenMax = 1;
        }

        for (int len = 1; len <= lenMax; len++) {
            int end = index + len;
            if (end > num.length()) {
                continue;
            }

            String sub = num.substring(index, end);
            long temp = Long.parseLong(sub);
            if (temp > Integer.MAX_VALUE || temp < Integer.MIN_VALUE) {
                continue;
            }
            int cur = (int) temp;

            if (index == 0) {
                sb.append(sub);
                addOperators(num, end, target, sum, cur, res, sb);
                sb.setLength(originalLen);
            } else {
                // operator is +
                sb.append('+').append(sub);
                addOperators(num, end, target, sum + pre, cur, res, sb);
                sb.setLength(originalLen);

                // operator is -
                sb.append('-').append(sub);
                addOperators(num, end, target, sum + pre, -cur, res, sb);
                sb.setLength(originalLen);

                // operator is *
                sb.append('*').append(sub);
                addOperators(num, end, target, sum, pre * cur, res, sb);
                sb.setLength(originalLen);
            }
        }
    }
}
```