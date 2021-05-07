# Game of Life

```java
class Solution {
//beats 13.37%
    public void gameOfLife(int[][] board) {
        if(board==null||board.length==0||board[0].length==0) return;
        for(int row=0;row<board.length;row++){
            for(int col=0;col<board[0].length;col++){
                changeStatus(board,row,col);
            }
        }
        for(int row=0;row<board.length;row++){
            for(int col=0;col<board[0].length;col++){
                restoreStatus(board,row,col);
            }
        }
    }
    
    private void changeStatus(int[][] board,int row,int col){
        /*
        * 0-0:2
        * 0-1:3
        * 1-0:4
        * 1-1:5
        */
        int m=board.length,n=board[0].length;
        int liveCnt=0;
        int deadCnt=0;
        if(row-1>=0&&col-1>=0){
            if(board[row-1][col-1]==0||board[row-1][col-1]==2||board[row-1][col-1]==3) deadCnt++;  //<Warn>:这里刚开始写的是4而不是3，注意是原始状态而不是改变后的状态
            else liveCnt++;
        }
        if(row-1>=0){
            if(board[row-1][col]==0||board[row-1][col]==2||board[row-1][col]==3) deadCnt++;
            else liveCnt++;
        }
        if(row-1>=0&&col+1<n){
            if(board[row-1][col+1]==0||board[row-1][col+1]==2||board[row-1][col+1]==3) deadCnt++;
            else liveCnt++;
        }
        if(col-1>=0){
            if(board[row][col-1]==0||board[row][col-1]==2||board[row][col-1]==3) deadCnt++;
            else liveCnt++;
        }
        if(col+1<n){
            if(board[row][col+1]==0||board[row][col+1]==2||board[row][col+1]==3) deadCnt++;
            else liveCnt++;
        }
        if(row+1<m&&col-1>=0){
            if(board[row+1][col-1]==0||board[row+1][col-1]==2||board[row+1][col-1]==3) deadCnt++;
            else liveCnt++;
        }
        if(row+1<m){
            if(board[row+1][col]==0||board[row+1][col]==2||board[row+1][col]==3) deadCnt++;
            else liveCnt++;
        }
        if(row+1<m&&col+1<n){
            if(board[row+1][col+1]==0||board[row+1][col+1]==2||board[row+1][col+1]==3) deadCnt++;
            else liveCnt++;
        }
        
        if(board[row][col]==1&&liveCnt<2){
            board[row][col]=4;
        }
        else if(board[row][col]==1&&liveCnt>=2&&liveCnt<=3){
            board[row][col]=5;
        }
        else if(board[row][col]==1&&liveCnt>3){
            board[row][col]=4;
        }
        else if(board[row][col]==0&&liveCnt==3){
            board[row][col]=3;
        }
        else{
            board[row][col]=2;
        }
    }
    
    private void restoreStatus(int[][] board,int row,int col){
        if(board[row][col]==2||board[row][col]==4) board[row][col]=0;
        else board[row][col]=1;
   }
}
```


```java
class Solution {
    /**
     * 0-0:2
     * 0-1:3
     * 1-0:4
     * 1-1:5
     */
    public void gameOfLife(int[][] board) {
        if(board==null||board.length==0||board[0].length==0) return;
        int m=board.length;
        int n=board[0].length;
        
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                int liveCnt=count(board,i,j);
                if(board[i][j]==1){
                    if(liveCnt<2) board[i][j]=4;
                    else if(liveCnt>3) board[i][j]=4;
                    else board[i][j]=5;
                }
                else{
                    if(liveCnt==3) board[i][j]=3;
                    else board[i][j]=2;
                }
            }
        }
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(board[i][j]==3||board[i][j]==5){
                    board[i][j]=1;
                }
                else{
                    board[i][j]=0;
                }
            }
        }
    }
    private int count(int[][] board,int row,int col){
        int m=board.length;
        int n=board[0].length;
        
        int left=row>0?row-1:row;
        int right=row<m-1?row+1:row;
        
        int top=col>0?col-1:col;
        int bottom=col<n-1?col+1:col;
        
        int liveCnt=0;
        
        for(int i=left;i<=right;i++){
            for(int j=top;j<=bottom;j++){
                if(i==row&&j==col) continue;
                if(board[i][j]==1||board[i][j]==4||board[i][j]==5){
                    liveCnt++;
                }
            }
        }
        return liveCnt;
    }
}
```