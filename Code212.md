# Word Search II

```java
public class Solution {
    private int row, col;

    public List<String> findWords(char[][] board, String[] words) {
        List<String> res = new LinkedList<>();
        if (board == null || board.length == 0 || board[0].length == 0) {
            return res;
        }
        row = board.length;
        col = board[0].length;
        for (String word : words) {
            if (search(board, word)) {
                res.add(word);
            }
        }
        return res;
    }

    private boolean search(char[][] board, String word) {
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                if (search(board, new boolean[row][col], i, j, word, 0)) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean search(char[][] board, boolean[][] used, int i, int j, String word, int index) {
        if (board[i][j] != word.charAt(index)) {
            return false;
        }
        if (index == word.length() - 1) {
            return true;
        }
        used[i][j] = true;
        if (i + 1 < row && !used[i + 1][j]) {
            if (search(board, used, i + 1, j, word, index + 1)) {
                return true;
            }
        }
        if (i - 1 >= 0 && !used[i - 1][j]) {
            if (search(board, used, i - 1, j, word, index + 1)) {
                return true;
            }
        }
        if (j + 1 < col && !used[i][j + 1]) {
            if (search(board, used, i, j + 1, word, index + 1)) {
                return true;
            }
        }
        if (j - 1 >= 0 && !used[i][j - 1]) {
            if (search(board, used, i, j - 1, word, index + 1)) {
                return true;
            }
        }
        used[i][j] = false;
        return false;
    }
}
```