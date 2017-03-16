# Unique Paths

```Java
public class Solution {
    public int uniquePaths(int m, int n) {
        if(m<=0||n<=0) return 0;
        int[][] dp=new int[m][n];
        dp[0][0]=1;
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(row==0&&col==0) continue;
                dp[row][col]=get(dp,row-1,col)+get(dp,row,col-1);
            }
        }
        return dp[m-1][n-1];
    }
    private int get(int[][] dp,int row,int col){
        if(row<0||col<0) return 0;
        return dp[row][col];
    }
}
```