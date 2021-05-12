# Palindrome Partitioning II

```java
class Solution {
    public int minCut(String s) {
        boolean[][] isPalindrome = new boolean[s.length()][s.length()];
        int[] cut = new int[s.length()];

        for (int len = 1; len <= s.length(); len++) {
            for (int start = 0; start <= s.length() - len; start++) {
                int end = start + len - 1;

                if (s.charAt(start) != s.charAt(end)) {
                    continue;
                }

                if (start + 1 > end - 1 || isPalindrome[start + 1][end - 1]) {
                    isPalindrome[start][end] = true;
                }
            }
        }

        for (int i = 0; i < s.length(); i++) {
            cut[i] = Integer.MAX_VALUE;
            for (int j = 0; j <= i; j++) {
                if (isPalindrome[j][i]) {
                    if (j == 0) {
                        cut[i] = Math.min(cut[i], 0);
                    } else {
                        cut[i] = Math.min(cut[i], cut[j - 1] + 1);
                    }
                } else {
                    cut[i] = Math.min(cut[i], cut[i - 1] + 1);
                }
            }
        }

        return cut[s.length() - 1];
    }
}
```