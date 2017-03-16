# Unique Paths II

```Java
//beats 18.12%
public class Solution {
    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        if(obstacleGrid==null||obstacleGrid.length==0||obstacleGrid[0].length==0) return 0;
        int m=obstacleGrid.length;
        int n=obstacleGrid[0].length;
        if(obstacleGrid[0][0]==1) return 0;
        int[][] dp=new int[m][n];
        dp[0][0]=1;
        
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(row==0&&col==0) continue;
                if(obstacleGrid[row][col]==1) dp[row][col]=0;
                else dp[row][col]=get(dp,row,col-1)+get(dp,row-1,col);
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