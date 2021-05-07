# N-Queens

```java
//beats 41.58%
class Solution {
    public List<List<String>> solveNQueens(int n) {
        boolean[] rows=new boolean[n];
        boolean[] cols=new boolean[n];
        boolean[] oblique1=new boolean[2*n-1];
        boolean[] oblique2=new boolean[2*n-1];
        
        List<List<String>> res=new ArrayList<List<String>>();
        List<String> cur=new ArrayList<String>();
        helper(rows,cols,oblique1,oblique2,res,cur,0,n);
        return res;
    }
    
    private void helper(boolean[] rows,boolean[] cols,boolean[] oblique1,boolean[] oblique2,List<List<String>> res,List<String> cur,int row,int n){
        if(row==n){
            res.add(new ArrayList<String>(cur));
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
            cur.add(buildString(n,col));
            helper(rows,cols,oblique1,oblique2,res,cur,row+1,n);
            rows[row]=false;
            cols[col]=false;
            oblique1[index1]=false;
            oblique2[index2]=false;
            cur.remove(cur.size()-1);
        }
    }
    
    private String buildString(int n,int pos){
        StringBuilder sb=new StringBuilder();
        for(int i=0;i<pos;i++){
            sb.append('.');
        }
        sb.append('Q');
        for(int i=pos+1;i<n;i++){
            sb.append('.');
        }
        return sb.toString();
    }
}
```