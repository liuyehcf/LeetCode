# Minimum Path Sum

```java
//beats 3.96%
class Solution {
    public int minPathSum(int[][] grid) {
        if(grid==null||grid.length==0||grid[0].length==0) return 0;
        int m=grid.length;
        int n=grid[0].length;
        
        int[][] dp=new int[m][n];
        dp[0][0]=grid[0][0];
        
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(row==0&&col==0) continue;
                dp[row][col]=grid[row][col]+Math.min(get(dp,row,col-1),get(dp,row-1,col));
            }
        }
        
        return dp[m-1][n-1];
    }
    
    private int get(int[][] dp,int row,int col){
        if(row<0||col<0) return Integer.MAX_VALUE;
        return dp[row][col];
    }
}
```