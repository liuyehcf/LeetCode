# Rotate Image

```java
class Solution {
    public void rotate(int[][] matrix) {
        if (matrix == null || matrix.length == 0 || matrix[0].length == 0) return;
        if (matrix.length != matrix[0].length) return;

        int n = matrix.length;
        for (int i = 0; i < n / 2; i++) {
            rotate(matrix, i);
        }
    }

    private void rotate(int[][] matrix, int i) {
        int n = matrix.length;

        int left = i, right = n - 1 - i;
        int top = i, bottom = n - 1 - i;

        for (int j = 0; j < right - left; j++) {
            int temp = matrix[top][left + j];
            matrix[top][left + j] = matrix[bottom - j][left];
            matrix[bottom - j][left] = matrix[bottom][right - j];
            matrix[bottom][right - j] = matrix[top + j][right];
            matrix[top + j][right] = temp;
        }
    }
}
```