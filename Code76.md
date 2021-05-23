# Minimum Window Substring

```java
class Solution {
    public String minWindow(String s, String t) {
        int[] cntT = new int[128];

        for (int i = 0; i < t.length(); i++) {
            cntT[t.charAt(i)]++;
        }

        int[] cntS = new int[128];
        int validLen = 0;

        int[] range = new int[]{-1, -1};

        int left = 0;
        int right = 0;
        int min = Integer.MAX_VALUE;

        while (right < s.length()) {
            if (cntS[s.charAt(right)]++ < cntT[s.charAt(right)]) {
                validLen++;
            }

            while (validLen == t.length()) {
                if (right - left + 1 < min) {
                    min = right - left + 1;
                    range[0] = left;
                    range[1] = right;
                }

                if (cntS[s.charAt(left)]-- <= cntT[s.charAt(left)]) {
                    validLen--;
                }

                left++;
            }

            right++;
        }

        if (min == Integer.MAX_VALUE) {
            return "";
        }

        return s.substring(range[0], range[1] + 1);
    }
}
```