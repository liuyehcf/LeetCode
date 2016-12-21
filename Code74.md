# Search a 2D Matrix

```Java
	//beats 7.07%
	public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        int m=matrix.length,n=matrix[0].length;
        int row=0,col=0;
        while(row<m&&col<n){
            if(matrix[row][col]==target) return true;
            if(row<m-1&&matrix[row+1][0]<=target){
                row++;
                col=0;
            }
            else if(matrix[row][col]<target){
                col++;
            }
            else{
                return false;
            }
        }
        return false;
    }
```

* 二分法用于查找一定存在的数，可以用套路法，但是对于这种不一定存在的数，可以采用相似的结构
* 循环条件的改变，或者左右下标的变更方式都可以微调
```Java
	//beats 68.22%
	public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        int m=matrix.length,n=matrix[0].length;
        
        //首先二分法确定所在的行
        int row=-1;
        int top=0,bottom=m-1;
        while(top<bottom-1){//由于下面top的赋值语句关系，当bottom=top+1时，如果走了else分支，那么循环是出不去的
            int mid=top+(bottom-top>>1);
            if(matrix[mid][0]>target){
                bottom=mid-1;
            }
            else{
                top=mid;//这里非常重要,绝对不能写mid+1，因为行首小于target,target也可能处于该行的范围中
            }
        }
        
        if(matrix[bottom][0]<=target) row=bottom;
        else row=top;
        
        //其次在找到的行，用二分法确定所在列
        
        int left=0,right=n-1;
        while(left<=right){
            int mid=left+(right-left>>1);
            if(matrix[row][mid]==target){
                return true;
            }
            else if(matrix[row][mid]>target){
                right=mid-1;
            }
            else{
                left=mid+1;
            }
        }
        
        //不去纠结到底哪个才是结果了
        if(right>=0&&matrix[row][right]==target) return true;
        if(left<=n-1&&matrix[row][left]==target) return true;
        
        return false;
    }
```