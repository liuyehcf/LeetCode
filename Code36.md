# Valid Sudoku

```java
//beats 43.49%
class Solution {
    public boolean isValidSudoku(char[][] board) {
        boolean[][] rows=new boolean[9][9];
        boolean[][] cols=new boolean[9][9];
        boolean[][] blocks=new boolean[9][9];
        
        for(int row=0;row<9;row++){
            for(int col=0;col<9;col++){
                if(board[row][col]=='.') continue;
                int num=board[row][col]-'1';
                int rowIndex=row;
                int colIndex=col;
                int blocksIndex=row/3*3+col/3;
                
                if(rows[rowIndex][num]) return false;
                if(cols[colIndex][num]) return false;
                if(blocks[blocksIndex][num]) return false;
                rows[rowIndex][num]=true;
                cols[colIndex][num]=true;
                blocks[blocksIndex][num]=true;
            }
        }
        return true;
    }
}
```