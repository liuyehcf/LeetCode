# Rotate Image

```Java
	//beats 61.12%
	public void rotate(int[][] matrix) {
        int n=matrix.length;
        for(int level=0;level<n/2;level++){
            for(int i=0;i<n-level*2-1;i++){
                helper(matrix,level,i);
            }
        }
    }
    
    private void helper(int[][] matrix,int level,int i){
        int top=level,bottom=matrix.length-1-level,left=level,right=matrix.length-1-level;
        int temp=matrix[top][left+i];
        matrix[top][left+i]=matrix[bottom-i][left];
        matrix[bottom-i][left]=matrix[bottom][right-i];
        matrix[bottom][right-i]=matrix[top+i][right];
        matrix[top+i][right]=temp;
    }
```