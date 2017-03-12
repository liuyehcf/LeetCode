# Sudoku Solver

```Java
//beats 87.66%
public class Solution {
    public void solveSudoku(char[][] board) {
        boolean[][] rows=new boolean[9][9];
        boolean[][] cols=new boolean[9][9];
        boolean[][] blocks=new boolean[9][9];
        
        for(int row=0;row<9;row++){
            for(int col=0;col<9;col++){
                if(board[row][col]=='.') continue;
                int rowIndex=row;
                int colIndex=col;
                int blockIndex=row/3*3+col/3;
                
                int num=board[row][col]-'1';
                
                rows[rowIndex][num]=true;
                cols[colIndex][num]=true;
                blocks[blockIndex][num]=true;
            }
        }
        
        helper(board,rows,cols,blocks);
    }
    
    private boolean helper(char[][] board,boolean[][] rows,boolean[][] cols,boolean[][] blocks){
        for(int row=0;row<9;row++){
            for(int col=0;col<9;col++){
                if(board[row][col]!='.') continue;
                
                int rowIndex=row;
                int colIndex=col;
                int blockIndex=row/3*3+col/3;
                
                for(int num=0;num<=8;num++){
                    if(!rows[rowIndex][num]&&!cols[colIndex][num]&&!blocks[blockIndex][num]){
                        rows[rowIndex][num]=true;
                        cols[colIndex][num]=true;
                        blocks[blockIndex][num]=true;
                        board[row][col]=(char)(num+'1');
                        if(helper(board,rows,cols,blocks)) return true;
                        rows[rowIndex][num]=false;
                        cols[colIndex][num]=false;
                        blocks[blockIndex][num]=false;
                        board[row][col]='.';
                    }
                }
                return false;
            }
        }
        return true;
    }
}
```