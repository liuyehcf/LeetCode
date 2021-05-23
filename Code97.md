# Interleaving String

```java
class Solution {
    public boolean isInterleave(String s1, String s2, String s3) {
        if (s1.length() + s2.length() != s3.length()) {
            return false;
        }

        return isInterleave(s1, 0, s2, 0, s3, 0);
    }

    private boolean isInterleave(String s1, int index1, String s2, int index2, String s3, int index3) {
        if (index3 == s3.length()) {
            return true;
        }

        if (index1 < s1.length() && s1.charAt(index1) == s3.charAt(index3)) {
            if (isInterleave(s1, index1 + 1, s2, index2, s3, index3 + 1)) {
                return true;
            }
        }

        if (index2 < s2.length() && s2.charAt(index2) == s3.charAt(index3)) {
            if (isInterleave(s1, index1, s2, index2 + 1, s3, index3 + 1)) {
                return true;
            }
        }

        return false;
    }
}
```