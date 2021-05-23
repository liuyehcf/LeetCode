# Word Search

```java
class Solution {
    public boolean exist(char[][] board, String word) {
        int m = board.length;
        if (m <= 0) {
            return false;
        }
        int n = board[0].length;
        if (n <= 0) {
            return false;
        }

        boolean[][] visited = new boolean[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (exist(board, visited, i, j, 0, word)) {
                    return true;
                }
            }
        }

        return false;
    }

    private boolean exist(char[][] board, boolean[][] visited, int row, int col, int index, String word) {
        int m = board.length;
        int n = board[0].length;

        if (visited[row][col]) {
            return false;
        }

        if (board[row][col] != word.charAt(index)) {
            return false;
        }

        if (index == word.length() - 1) {
            return true;
        }

        try {
            visited[row][col] = true;

            // up
            if (row - 1 >= 0 && !visited[row - 1][col]) {
                if (exist(board, visited, row - 1, col, index + 1, word)) {
                    return true;
                }
            }

            // down
            if (row + 1 < m && !visited[row + 1][col]) {
                if (exist(board, visited, row + 1, col, index + 1, word)) {
                    return true;
                }
            }

            // left
            if (col - 1 >= 0 && !visited[row][col - 1]) {
                if (exist(board, visited, row, col - 1, index + 1, word)) {
                    return true;
                }
            }

            // right
            if (col + 1 < n && !visited[row][col + 1]) {
                if (exist(board, visited, row, col + 1, index + 1, word)) {
                    return true;
                }
            }

            return false;
        } finally {
            visited[row][col] = false;
        }

    }
}
```