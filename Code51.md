# N-Queens

```java
class Solution {
    public List<List<String>> solveNQueens(int n) {
        List<List<String>> res = new ArrayList<>();
        List<String> solution = new ArrayList<>();

        boolean[] cols = new boolean[n];
        boolean[] diagonals1 = new boolean[2 * n - 1];
        boolean[] diagonals2 = new boolean[2 * n - 1];

        solveNQueens(res, solution, cols, diagonals1, diagonals2, 0, n);

        return res;
    }

    private void solveNQueens(List<List<String>> res, List<String> solution,
                              boolean[] cols, boolean[] diagonals1, boolean[] diagonals2,
                              int row, int n) {
        if (row == n) {
            res.add(new ArrayList<>(solution));
            return;
        }

        for (int col = 0; col < n; col++) {
            int diagonal1 = row + col;
            int diagonal2 = n - 1 - row + col;

            if (cols[col]
                    || diagonals1[diagonal1]
                    || diagonals2[diagonal2]) {
                continue;
            }

            cols[col] = true;
            diagonals1[diagonal1] = true;
            diagonals2[diagonal2] = true;
            solution.add(getLine(n, col));

            solveNQueens(res, solution, cols, diagonals1, diagonals2, row + 1, n);

            solution.remove(solution.size() - 1);
            diagonals2[diagonal2] = false;
            diagonals1[diagonal1] = false;
            cols[col] = false;
        }
    }

    private String getLine(int n, int index) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < index; i++) {
            sb.append('.');
        }
        sb.append('Q');
        for (int i = index + 1; i < n; i++) {
            sb.append('.');
        }

        return sb.toString();
    }
}
```