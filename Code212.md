# Word Search II

* ��ʱ
```java
class Solution {
public List<String> findWords(char[][] board, String[] words) {
        Set<String> set=new HashSet<String>();
        int m=board.length;
        int n=board[0].length;
        for(String word:words){
            boolean flag=false;
            for(int row=0;row<m;row++){
                if(flag) break;
                for(int col=0;col<n;col++){
                    if(flag) break;
                    boolean[][] visited=new boolean[m][n];
                    if(findWord(board,visited,word,0,row,col)) {
                        set.add(word);
                        flag=true;
                    }
                }
            }
        }
        return new ArrayList<String>(set);
    }
    
    private boolean findWord(char[][] board,boolean[][] visited,String word,int pos,int row,int col){
        if(board[row][col]!=word.charAt(pos)) return false;
        //System.out.println(row+","+col+","+pos);
        if(pos==word.length()-1) return true;
        
        visited[row][col]=true;
        
        int m=board.length;
        int n=board[0].length;
        
        if(row>0&&!visited[row-1][col]&&findWord(board,visited,word,pos+1,row-1,col)){
            return true;
        }
        
        if(row<m-1&&!visited[row+1][col]&&findWord(board,visited,word,pos+1,row+1,col)){
            return true;
        }
        
        if(col>0&&!visited[row][col-1]&&findWord(board,visited,word,pos+1,row,col-1)){
            return true;
        }
        
        if(col<n-1&&!visited[row][col+1]&&findWord(board,visited,word,pos+1,row,col+1)){
            return true;
        }
        
        visited[row][col]=false;
        return false;
   }
}
```