# Maximal Square


```Java
//beats 58.60%
public class Solution {
    public int maximalSquare(char[][] matrix) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return 0;
        int m=matrix.length;
        int n=matrix[0].length;
        
        int res=0;
        
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                int len=1;
                while(helper(matrix,i,j,len++))
                res=Math.max(res,(len-1)*(len-1));
            }
        }
        
        return res;
    }
    
    private boolean helper(char[][] matrix,int row,int col,int len){
        int m=matrix.length;
        int n=matrix[0].length;
        if(row+len-1>=m) return false;
        if(col+len-1>=n) return false;
        
        for(int i=0;i<len;i++){
            if(matrix[row+len-1][col+i]=='0') return false;
            if(matrix[row+i][col+len-1]=='0') return false;
        }
        return true;
    }
}
```