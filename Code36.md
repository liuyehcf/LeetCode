# Valid Sudoku

```java
class Solution {
    public boolean isValidSudoku(char[][] board) {
        boolean[][] rows = new boolean[9][9];
        boolean[][] cols = new boolean[9][9];
        boolean[][] blocks = new boolean[9][9];

        for (int row = 0; row < 9; row++) {
            for (int col = 0; col < 9; col++) {
                if (board[row][col] == '.') continue;
                int offset = board[row][col] - '1';
                int block = row / 3 * 3 + col / 3;

                if (rows[row][offset]) {
                    return false;
                }
                if (cols[col][offset]) {
                    return false;
                }
                if (blocks[block][offset]) {
                    return false;
                }
                rows[row][offset] = true;
                cols[col][offset] = true;
                blocks[block][offset] = true;
            }
        }
        return true;
    }
}
```