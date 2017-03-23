# Word Search

```Java
//beats 85.01%
public class Solution {
    public boolean exist(char[][] board, String word) {
        if(board==null||board.length==0||board[0].length==0) return false;
        int m=board.length;
        int n=board[0].length;
        boolean[][] isUsed=new boolean[m][n];
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(helper(board,row,col,isUsed,word,0)) return true;
            }
        }
        return false;
    }
    
    private boolean helper(char[][] board,int row,int col,boolean[][] isUsed, String word,int pos){
        if(board[row][col]!=word.charAt(pos)) return false;
        if(pos==word.length()-1) return true;
        
        int m=board.length;
        int n=board[0].length;
        
        isUsed[row][col]=true;
        if(row>0&&!isUsed[row-1][col]){
            if(helper(board,row-1,col,isUsed,word,pos+1)) return true;
        }
        
        if(row<m-1&&!isUsed[row+1][col]){
            if(helper(board,row+1,col,isUsed,word,pos+1)) return true;
        }
        
        if(col>0&&!isUsed[row][col-1]){
            if(helper(board,row,col-1,isUsed,word,pos+1)) return true;
        }
        
        if(col<n-1&&!isUsed[row][col+1]){
            if(helper(board,row,col+1,isUsed,word,pos+1)) return true;
        }
        
        isUsed[row][col]=false;
        
        return false;
    }
}
```