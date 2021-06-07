# Reverse Words in a String

```java
class Solution {
    public String reverseWords(String s) {
        List<String> words = new LinkedList<>();

        int i = 0;
        while (i < s.length()) {
            char c = s.charAt(i);
            if (c == ' ') {
                i++;
                continue;
            }

            StringBuilder sb = new StringBuilder();
            while (i < s.length() &&
                    ((c = s.charAt(i)) >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9')) {
                sb.append(c);
                i++;
            }

            words.add(0, sb.toString());
        }

        StringBuilder sb = new StringBuilder();
        for (String word : words) {
            sb.append(' ').append(word);
        }

        return sb.substring(1);
    }
}
```