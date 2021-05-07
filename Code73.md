# Set Matrix Zeroes

```java
//beats 27.46%
class Solution {
    public void setZeroes(int[][] matrix) {
        int m=matrix.length;
        int n=matrix[0].length;
        
        boolean[] rows=new boolean[m];
        boolean[] cols=new boolean[n];
        
        for(int row=0;row<m;row++){
            for(int col=0;col<n;col++){
                if(matrix[row][col]==0){
                    rows[row]=true;
                    cols[col]=true;
                }
            }
        }
        
        for(int i=0;i<m;i++){
            if(rows[i]){
                for(int j=0;j<n;j++){
                    matrix[i][j]=0;
                }
            }
        }
        
        for(int i=0;i<n;i++){
            if(cols[i]){
                for(int j=0;j<m;j++){
                    matrix[j][i]=0;
                }
            }
        }
    }
}
```