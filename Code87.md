# Scramble String

```java
class Solution {
    public boolean isScramble(String s1, String s2) {
        if (s1.length() == 1) {
            return s1.equals(s2);
        }

        int[] letters = new int[26];
        for (int i = 0; i < s1.length(); i++) {
            letters[s1.charAt(i) - 'a']++;
            letters[s2.charAt(i) - 'a']--;
        }
        for (int i = 0; i < 26; i++) if (letters[i] != 0) return false;

        for (int i = 1; i <= s1.length() - 1; i++) {
            String x = s1.substring(0, i);
            String y = s1.substring(i);

            if (isScramble(x, s2.substring(0, i))
                    && isScramble(y, s2.substring(i))) {
                return true;
            }

            if (isScramble(y, s2.substring(0, y.length()))
                    && isScramble(x, s2.substring(y.length()))) {
                return true;
            }
        }

        return false;
    }
}
```