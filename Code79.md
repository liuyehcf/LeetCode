# Word Search

```Java
	//beats 85.01%
	public boolean exist(char[][] board, String word) {
        if(board==null||board.length==0||board[0].length==0) throw new RuntimeException();
        int m=board.length,n=board[0].length;
        boolean[][] isVisited=new boolean[m][n];
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(helper(board,i,j,word,0,isVisited)) return true;
            }
        }
        return false;
    }
    
    private boolean helper(char[][] board,int row,int col,String word,int pos,boolean[][] isVisited){
        if(board[row][col]!=word.charAt(pos)) return false;
        if(pos==word.length()-1) return true;

        isVisited[row][col]=true;
        
        int m=board.length,n=board[0].length;
        if(row<m-1&&!isVisited[row+1][col]) if(helper(board,row+1,col,word,pos+1,isVisited)) return true;
        if(row>0&&!isVisited[row-1][col]) if(helper(board,row-1,col,word,pos+1,isVisited)) return true;
        if(col<n-1&&!isVisited[row][col+1]) if(helper(board,row,col+1,word,pos+1,isVisited)) return true;
        if(col>0&&!isVisited[row][col-1]) if(helper(board,row,col-1,word,pos+1,isVisited)) return true;
        
        isVisited[row][col]=false;
        return false;
    }
```