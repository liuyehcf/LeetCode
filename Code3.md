# Longest Substring Without Repeating Characters

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int[] cnt = new int[128];
        int max = 0;
        int left = 0;

        for (int i = 0; i < s.length(); i++) {
            int c = s.charAt(i);
            cnt[c]++;

            while (cnt[c] > 1) {
                cnt[s.charAt(left++)]--;
            }

            max = Math.max(max, i - left + 1);
        }

        return max;
    }
}
```