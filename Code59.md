# Spiral Matrix II

```Java
	//beats 14.48%
	private int iter;
    public int[][] generateMatrix(int n) {
        int[][] matrix=new int[n][n];
        iter=1;
        for(int level=0;level<(n+1)/2;level++){
            fill(matrix,level);
        }
        return matrix;
    }
    
    private void fill(int[][] matrix,int level){
        int n=matrix.length;
        int left=level,right=n-1-level;
        int top=level,bottom=n-1-level;
        if(left==right){  //这里很重要
            matrix[top][left]=iter++;
            return;
        }
        
        for(int i=left;i<right;i++){
            matrix[top][i]=iter++;
        }
        for(int i=top;i<bottom;i++){
            matrix[i][right]=iter++;
        }
        for(int i=right;i>left;i--){
            matrix[bottom][i]=iter++;
        }
        for(int i=bottom;i>top;i--){
            matrix[i][left]=iter++;
        }
    }
```