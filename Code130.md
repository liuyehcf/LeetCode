# Surrounded Regions

```java
public class Solution {
    public void solve(char[][] board) {
        if (board == null || board.length < 3 || board[0].length < 3) return;
        int row = board.length;
        int col = board[0].length;
        for (int i = 0; i < row; i++) {
            check(board, i, 0, row, col);
            check(board, i, col - 1, row, col);
        }
        for (int j = 0; j < col; j++) {
            check(board, 0, j, row, col);
            check(board, row - 1, j, row, col);
        }
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                if (board[i][j] == 'O') board[i][j] = 'X';
            }
        }

        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                if (board[i][j] == '1') board[i][j] = 'O';
            }
        }
    }

    void check(char[][] board, int i, int j, int row, int col) {
        if (board[i][j] == 'O') {
            board[i][j] = '1';
            if (i > 1) {
                check(board, i - 1, j, row, col);
            }
            if (j > 1) {
                check(board, i, j - 1, row, col);
            }
            if (i + 1 < row) {
                check(board, i + 1, j, row, col);
            }
            if (j + 1 < col) {
                check(board, i, j + 1, row, col);
            }
        }
    }
}
```