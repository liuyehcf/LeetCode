# Surrounded Regions

```java
public class Solution {
    public void solve(char[][] board) {
        if (board == null || board.length < 3 || board[0].length < 3) {
            return;
        }
        int rows = board.length;
        int cols = board[0].length;
        for (int row = 0; row < rows; row++) {
            markUnSurrounded(board, row, 0);
            markUnSurrounded(board, row, cols - 1);
        }
        for (int col = 0; col < cols; col++) {
            markUnSurrounded(board, 0, col);
            markUnSurrounded(board, rows - 1, col);
        }

        // eat surrounded 'O'
        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                if (board[row][col] == 'O') board[row][col] = 'X';
            }
        }

        // remark un surrounded
        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                if (board[row][col] == '1') board[row][col] = 'O';
            }
        }
    }

    void markUnSurrounded(char[][] board, int i, int j) {
        int rows = board.length;
        int cols = board[0].length;

        if (board[i][j] == 'O') {
            board[i][j] = '1';
            if (i > 1) {
                markUnSurrounded(board, i - 1, j);
            }
            if (j > 1) {
                markUnSurrounded(board, i, j - 1);
            }
            if (i + 1 < rows) {
                markUnSurrounded(board, i + 1, j);
            }
            if (j + 1 < cols) {
                markUnSurrounded(board, i, j + 1);
            }
        }
    }
}
```