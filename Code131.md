# Palindrome Partitioning

```java
class Solution {
    public List<List<String>> partition(String s) {
        List<List<String>> res = new ArrayList<>();
        List<String> solution = new ArrayList<>();

        partition(res, solution, s, 0);

        return res;
    }

    private void partition(List<List<String>> res, List<String> solution,
                           String s, int start) {
        if (start == s.length()) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int end = start; end < s.length(); end++) {
            if (isPalindrome(s, start, end)) {
                solution.add(s.substring(start, end + 1));

                partition(res, solution, s, end + 1);

                solution.remove(solution.size() - 1);
            }
        }
    }

    private boolean isPalindrome(String s, int start, int end) {
        while (start < end) {
            if (s.charAt(start++) != s.charAt(end--)) {
                return false;
            }
        }

        return true;
    }
}
```