# Spiral Matrix

```Java
//beats 15.46%
public class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> res=new ArrayList<Integer>();
        
        if(matrix==null||matrix.length==0||matrix[0].length==0) return res;
        
        int m=matrix.length;
        int n=matrix[0].length;
        
        for(int i=0;i<(m+1)/2&&i<(n+1)/2;i++){
            helper(matrix,res,i);
        }
        
        return res;
    }
    
    private void helper(int[][] matrix,List<Integer> res,int pos){
        int m=matrix.length;
        int n=matrix[0].length;
        int left=pos,right=n-1-pos;
        int top=pos,bottom=m-1-pos;
        
        for(int i=left;i<=right;i++){
            res.add(matrix[top][i]);
        }
        for(int i=top+1;i<=bottom;i++){
            res.add(matrix[i][right]);
        }
        if(top!=bottom){
            for(int i=right-1;i>=left;i--){
                res.add(matrix[bottom][i]);
            }
        }
        if(left!=right){
            for(int i=bottom-1;i>top;i--){
                res.add(matrix[i][left]);
            }
        }
        
    }
}
```