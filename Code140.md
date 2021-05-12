# Word Break II

```java
class Solution {
    public List<String> wordBreak(String s, List<String> wordDict) {
        List<String> res = new ArrayList<>();

        List<String> cur = new ArrayList<>();

        wordBreak(res, cur, s, 0, wordDict);

        return res;
    }

    private void wordBreak(List<String> res, List<String> cur,
                           String s, int index, List<String> wordDict) {
        if (index == s.length()) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < cur.size(); i++) {
                if (i != 0) {
                    sb.append(' ');
                }
                sb.append(cur.get(i));
            }

            res.add(sb.toString());

            return;
        }

        for (String word : wordDict) {
            if (isMatched(s, index, word)) {

                cur.add(word);

                wordBreak(res, cur, s, index + word.length(), wordDict);

                cur.remove(cur.size() - 1);
            }
        }
    }

    private boolean isMatched(String s, int index, String target) {
        if (s.length() - index < target.length()) {
            return false;
        }

        for (int i = 0; i < target.length(); i++) {
            if (s.charAt(index + i) != target.charAt(i)) {
                return false;
            }
        }

        return true;
    }
}
```