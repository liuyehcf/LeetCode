# Longest Common Prefix

```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if (strs == null || strs.length == 0) {
            return "";
        }

        int index = 0;

        while (true) {
            Character c = null;

            for (String str : strs) {
                if (index == str.length()) {
                    return str;
                }

                if (c == null) {
                    c = str.charAt(index);
                } else {
                    if (str.charAt(index) != c) {
                        return str.substring(0, index);
                    }
                }
            }

            index++;
        }
    }
}
```