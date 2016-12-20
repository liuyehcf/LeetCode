# Spiral Matrix

```Java
	//beats 15.46%
	public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> res=new ArrayList<Integer>();
        if(matrix==null||matrix.length==0||matrix[0].length==0) return res;
        int m=matrix.length,n=matrix[0].length;
        for(int level=0;level<(Math.min(m,n)+1)/2;level++){
            helper(matrix,level,res);
        }
        return res;
    }
    
    private void helper(int[][] matrix,int level,List<Integer> res){
        int top=level,bottom=matrix.length-1-level,left=level,right=matrix[0].length-1-level;
        
        if(top==bottom&&left==right) {
            res.add(matrix[top][left]);
            return;
        }
        else if(top==bottom){
            for(int i=left;i<=right;i++){
                res.add(matrix[top][i]);
            }
            return;
        }
        else if(left==right){
            for(int i=top;i<=bottom;i++){
                res.add(matrix[i][left]);
            }
            return;
        }
        
        
        for(int i=left;i<right;i++){
            res.add(matrix[top][i]);
        }
        
        for(int i=top;i<bottom;i++){
            res.add(matrix[i][right]);
        }
        
        for(int i=right;i>left;i--){
            res.add(matrix[bottom][i]);
        }
        
        for(int i=bottom;i>top;i--){
            res.add(matrix[i][left]);
        }
    }
```