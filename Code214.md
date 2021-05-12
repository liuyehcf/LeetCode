# Shortest Palindrome

```java
class Solution {
    public String shortestPalindrome(String s) {
        if (s.length() == 0) {
            return s;
        }

        int mid = s.length() >> 1;

        for (int i = mid; i >= 0; i--) {
            int missLen = Integer.MAX_VALUE;

            if (i - 1 >= 0 && isPalindrome(s, i, i - 1)) {
                missLen = Math.min(missLen, (s.length() - 1 - i + 1) - (i - 1 - 0 + 1));
            }

            boolean rightSideGreaterThanLeftSide = s.length() - 1 - i + 1 >= i - 0 + 1;
            if (rightSideGreaterThanLeftSide && isPalindrome(s, i, i)) {
                missLen = Math.min(missLen, (s.length() - 1 - i + 1) - (i - 0 + 1));
            }

            if (missLen != Integer.MAX_VALUE) {
                return reverse(s.substring(s.length() - missLen)) + s;
            }
        }

        throw new RuntimeException();
    }

    private boolean isPalindrome(String s, int left, int right) {
        while (left >= 0) {
            if (s.charAt(left--) != s.charAt(right++)) {
                return false;
            }
        }

        return true;
    }

    private String reverse(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = s.length() - 1; i >= 0; i--) {
            sb.append(s.charAt(i));
        }

        return sb.toString();
    }
}
```


```java
class Solution {
    public String shortestPalindrome(String s) {
        if (s.length() == 0) return s;
        String ss = s + "&" + new StringBuilder(s).reverse().toString();

        int[] pi = new int[ss.length()];

        pi[0] = 0;
        int k = 0;

        for (int i = 1; i < ss.length(); i++) {
            while (k > 0 && ss.charAt(k + 1 - 1) != ss.charAt(i)) {
                k = pi[k - 1];
            }
            if (ss.charAt(k + 1 - 1) == ss.charAt(i)) {
                k++;
            }
            pi[i] = k;
        }
        return new StringBuilder(s.substring(pi[ss.length() - 1])).reverse().toString() + s;
    }
}
```