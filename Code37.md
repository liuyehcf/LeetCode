# Sudoku Solver

```java
class Solution {
    public void solveSudoku(char[][] board) {
        boolean[][] rows = new boolean[9][9];
        boolean[][] cols = new boolean[9][9];
        boolean[][] blocks = new boolean[9][9];

        for (int row = 0; row < 9; row++) {
            for (int col = 0; col < 9; col++) {
                if (board[row][col] == '.') {
                    continue;
                }

                int block = row / 3 * 3 + col / 3;
                int offset = board[row][col] - '1';

                rows[row][offset] = true;
                cols[col][offset] = true;
                blocks[block][offset] = true;
            }
        }

        solveSudoku(board, 0, 0, rows, cols, blocks);
    }

    private boolean solveSudoku(char[][] board, int row, int col,
                                boolean[][] rows, boolean[][] cols, boolean[][] blocks) {
        if (row == 9) {
            return true;
        }

        if (col == 9) {
            return solveSudoku(board, row + 1, 0, rows, cols, blocks);
        }

        if (board[row][col] == '.') {
            int block = row / 3 * 3 + col / 3;

            for (int i = 0; i < 9; i++) {
                if (rows[row][i]
                        || cols[col][i]
                        || blocks[block][i]) {
                    continue;
                }

                rows[row][i] = true;
                cols[col][i] = true;
                blocks[block][i] = true;

                board[row][col] = (char) ('1' + i);
                if (solveSudoku(board, row, col + 1, rows, cols, blocks)) {
                    return true;
                }
                board[row][col] = '.';

                blocks[block][i] = false;
                cols[col][i] = false;
                rows[row][i] = false;
            }

            return false;
        } else {
            return solveSudoku(board, row, col + 1, rows, cols, blocks);
        }
    }
}
```