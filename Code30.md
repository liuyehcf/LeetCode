# Substring with Concatenation of All Words

```java
class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
        List<Integer> res = new ArrayList<>();

        if (s == null || s.length() == 0 || words == null || words.length == 0) {
            return res;
        }

        int totalLength = 0;
        for (String word : words) {
            totalLength += word.length();
        }

        if (s.length() < totalLength) {
            return res;
        }

        boolean[] used = new boolean[words.length];

        for (int i = 0; i < s.length() - totalLength + 1; i++) {
            findSubstring(res, s, i, words, used, 0, totalLength);
        }

        return res;
    }

    private boolean findSubstring(List<Integer> res, String s, int start, String[] words, boolean[] used, int indexOfWord, int totalLength) {
        if (indexOfWord == words.length) {
            res.add(start - totalLength);
            return true;
        }

        Set<String> hasTried = new HashSet<>();

        for (int i = 0; i < words.length; i++) {
            if (used[i]) {
                continue;
            }

            String word = words[i];
            if (!hasTried.add(word)) {
                continue;
            }

            if (Objects.equals(s.substring(start, start + word.length()), word)) {
                used[i] = true;
                if (findSubstring(res, s, start + word.length(), words, used, indexOfWord + 1, totalLength)) {
                    used[i] = false;
                    return true;
                }
                used[i] = false;
            }
        }

        return false;
    }
}
```