# Decode Ways

```java
class Solution {
    public int numDecodings(String s) {
        int[] dp = new int[s.length() + 1];

        dp[0] = 1;

        for (int i = 1; i <= s.length(); i++) {
            String sub1 = s.substring(i - 1, i);
            int val1 = Integer.parseInt(sub1);

            if (val1 >= 1 && val1 <= 9) {
                dp[i] += dp[i - 1];
            }

            if (i > 1) {
                String sub2 = s.substring(i - 2, i);
                int val2 = Integer.parseInt(sub2);

                if (val2 >= 10 && val2 <= 26) {
                    dp[i] += dp[i - 2];
                }
            }
        }

        return dp[s.length()];
    }
}
```