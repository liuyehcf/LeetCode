# Implement strStr()

KMP算法

```java
class Solution {
    public int strStr(String haystack, String needle) {
        // next[i]表示，[0, i)这个区间内的最大前后缀长度
        int[] next = new int[needle.length() + 1];

        next[0] = -1;

        int i = 0;
        // 本身不计算
        int j = -1;

        while (i < needle.length()) {
            if (j == -1 || needle.charAt(i) == needle.charAt(j)) {
                // 此时前缀为[0...j]，长度为j+1，对应的区间为[0, i+1)
                next[i + 1] = j + 1;

                i++;
                j++;
            } else {
                // 由于在索引j处失序，而[0, j)是匹配的，前后缀的长度是next[j]，因此下一个待匹配的索引正好是next[j]
                j = next[j];
            }
        }

        i = 0;
        // 两个相同也要计算
        j = 0;

        while (i < haystack.length() && j < needle.length()) {
            if (j == -1 || haystack.charAt(i) == needle.charAt(j)) {
                i++;
                j++;
            } else {
                // 由于在索引j处失序，而[0, j)是匹配的，前后缀的长度是next[j]，因此下一个待匹配的索引正好是next[j]
                j = next[j];
            }
        }

        if (j == needle.length()) {
            return i - j;
        } else {
            return -1;
        }
    }
}
```