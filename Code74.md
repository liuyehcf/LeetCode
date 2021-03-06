# Search a 2D Matrix

## 二分法

```java
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;

        int top = 0, bottom = m - 1;

        while (top < bottom) {
            int mid = top + (bottom - top >> 1);

            if (matrix[mid][0] == target) {
                return true;
            } else if (matrix[mid][0] < target) {
                top = mid + 1;
            } else {
                bottom = mid;
            }
        }

        if (matrix[top][0] > target) {
            top--;
        }

        if (top < 0) {
            return false;
        }

        int left = 0, right = n - 1;
        while (left < right) {
            int mid = left + (right - left >> 1);

            if (matrix[top][mid] == target) {
                return true;
            } else if (matrix[top][mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }

        return matrix[top][left] == target;
    }
}
```

## brilliant solution

```java
//#########^^^^^^^^^
//#########^^^^^^^^^
//#########^^^^^^^^^
//########$+++++++++
//********++++++++++
//********++++++++++
//********++++++++++
//当$<target,那么由#组成的区域(包括$)都会比target小，因此该区域可以舍弃
//当$>target,那么由+组成的区域(包括$)都会比target大，因此该区域可以舍弃
//但是这样看起来要找的数可能还会存在于^组成的区域中，但实际上这是不可能的，^是由#和和+共同组成的区域
//因此要找的数只可能存在于*中
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int m = matrix.length;
        int n = matrix[0].length;

        int row = 0, col = n - 1;
        while (row < m && col >= 0) {
            if (matrix[row][col] == target) return true;
            else if (matrix[row][col] > target) {
                col--;
            } else {
                row++;
            }
        }
        return false;
    }
}
```