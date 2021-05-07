# beats 76.79%


```java
class Solution {
    private int cnt;
    public int totalNQueens(int n) {
        cnt=0;
        boolean[] rows=new boolean[n];
        boolean[] cols=new boolean[n];
        boolean[] oblique1=new boolean[2*n-1];
        boolean[] oblique2=new boolean[2*n-1];
        
        helper(rows,cols,oblique1,oblique2,0,n);
        return cnt;
    }
    
    
    private void helper(boolean[] rows,boolean[] cols,boolean[] oblique1,boolean[] oblique2,int row,int n){
        if(row==n){
            cnt++;
            return;
        }
        
        for(int col=0;col<n;col++){
            int index1=row+col;
            int index2=row-col+n-1;
            if(rows[row]||cols[col]||oblique1[index1]||oblique2[index2]) continue;
            rows[row]=true;
            cols[col]=true;
            oblique1[index1]=true;
            oblique2[index2]=true;
            helper(rows,cols,oblique1,oblique2,row+1,n);
            rows[row]=false;
            cols[col]=false;
            oblique1[index1]=false;
            oblique2[index2]=false;
        }
    }
}
```