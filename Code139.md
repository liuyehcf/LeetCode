# Word Break

```java
class Solution {
    public boolean wordBreak(String s, List<String> list) {
        Set<String> wordDict = new HashSet<>(list);

        Set<Integer> lens = wordDict.stream()
                .map(String::length)
                .collect(Collectors.toSet());

        boolean[] dp = new boolean[s.length() + 1];
        dp[0] = true;

        for (int end = 1; end <= s.length(); end++) {

            for (int len : lens) {
                int start = end - len + 1;

                if (start <= 0) {
                    continue;
                }


                if (wordDict.contains(s.substring(start - 1, end))) {
                    dp[end] = dp[start - 1];
                }

                if (dp[end]) {
                    break;
                }
            }
        }

        return dp[s.length()];
    }
}
```