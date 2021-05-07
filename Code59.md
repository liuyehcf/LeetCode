# Spiral Matrix II

```java
class Solution {
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
}
```

```java
class Solution {
    private int cnt;
    public int[][] generateMatrix(int n) {
        int[][] matrix=new int[n][n];
        cnt=1;
        for(int i=0;i<(n+1)/2;i++){
            helper(matrix,i);
        }
        return matrix;
    }
    
    private void helper(int[][] matrix,int pos){
        int n=matrix.length;
        int left=pos,right=n-1-pos;
        int top=pos,bottom=n-1-pos;
        
        for(int i=left;i<=right;i++){
            matrix[top][i]=cnt++;
        }
        
        for(int i=top+1;i<=bottom;i++){
            matrix[i][right]=cnt++;
        }
        
        for(int i=right-1;i>=left;i--){
            matrix[bottom][i]=cnt++;
        }
        
        for(int i=bottom-1;i>top;i--){
            matrix[i][left]=cnt++;
        }
    }
}
```