# Letter Combinations of a Phone Number

```java
class Solution {
    private String[] table = {
            "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"
    };

    public List<String> letterCombinations(String digits) {
        List<String> res = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        if (digits.length() == 0) {
            return res;
        }
        letterCombinations(digits, 0, sb, res);
        return res;
    }

    private void letterCombinations(String digits, int pos, StringBuilder sb, List<String> res) {
        if (pos == digits.length()) {
            res.add(sb.toString());
            return;
        }
        for (char c : table[digits.charAt(pos) - '2'].toCharArray()) {
            int size = sb.length();
            sb.append(c);

            letterCombinations(digits, pos + 1, sb, res);
            
            sb.setLength(size);
        }
    }
}
```