# Set Matrix Zeroes

```Java
	//beats 26.35%
	public void setZeroes(int[][] matrix) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) throw new RuntimeException();
        int m=matrix.length,n=matrix[0].length;
        boolean[] rowsZero=new boolean[m];
        boolean[] colsZero=new boolean[n];
        
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                if(matrix[i][j]==0){
                    rowsZero[i]=true;
                    colsZero[j]=true;
                }
            }
        }
        
        for(int i=0;i<m;i++){
            if(rowsZero[i]) fill(matrix,i,'r');
        }
        
        for(int i=0;i<n;i++){
            if(colsZero[i]) fill(matrix,i,'c');
        }
    }
    
    private void fill(int[][] matrix,int i,char c){
        int m=matrix.length,n=matrix[0].length;
        if(c=='r'){
            for(int j=0;j<n;j++){
                matrix[i][j]=0;
            }
        }
        else if(c=='c'){
            for(int j=0;j<m;j++){
                matrix[j][i]=0;
            }
        }
        else{
            throw new RuntimeException();
        }
    }
```