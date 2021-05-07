# Longest Increasing Path in a Matrix

* ��̬�滮����һ��Ķ�̬�滮��ͬ�����ֻ�Ǳ����˼������ֵ���е��������¼�Ķ�̬�滮
```Java
    //beats 31.74
    public int longestIncreasingPath(int[][] matrix) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return 0;
        int m=matrix.length;
        int n=matrix[0].length;
        int res=0;
        int[][] dp=new int[m][n];
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                res=Math.max(res,helper(dp,matrix,row,col));
            }
        }
        return res;
    }
    
    private int helper(int[][] dp,int[][] matrix,int row,int col){
        int m=matrix.length;
        int n=matrix[0].length;
        dp[row][col]=1;
        if(row>0&&matrix[row][col]<matrix[row-1][col]){
            if(dp[row-1][col]==0)
                dp[row-1][col]=helper(dp,matrix,row-1,col);
            dp[row][col]=Math.max(dp[row-1][col]+1,dp[row][col]);
        }
        if(row<m-1&&matrix[row][col]<matrix[row+1][col]){
            if(dp[row+1][col]==0)
                dp[row+1][col]=helper(dp,matrix,row+1,col);
            dp[row][col]=Math.max(dp[row+1][col]+1,dp[row][col]);
        }
        if(col>0&&matrix[row][col]<matrix[row][col-1]){
            if(dp[row][col-1]==0)
                dp[row][col-1]=helper(dp,matrix,row,col-1);
            dp[row][col]=Math.max(dp[row][col-1]+1,dp[row][col]);
        }
        if(col<n-1&&matrix[row][col]<matrix[row][col+1]){
            if(dp[row][col+1]==0)
                dp[row][col+1]=helper(dp,matrix,row,col+1);
            dp[row][col]=Math.max(dp[row][col+1]+1,dp[row][col]);
        }
        return dp[row][col];
    }
```