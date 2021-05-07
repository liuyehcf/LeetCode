# Search a 2D Matrix II

```java
//beats 6.96%
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        
        int m=matrix.length,n=matrix[0].length;
        
        if(matrix[0][0]>target||matrix[m-1][n-1]<target) return false;
        
        int top=0,bottom=m-1;
        
        while(top<=bottom){
            int mid=top+(bottom-top>>1);
            if(matrix[mid][n-1]<target){
                top=mid+1;
            }
            else{
                bottom=mid-1;
            }
        }
        
        List<Integer> list=new ArrayList<Integer>();
        while(top<m&&matrix[top][0]<=target){
            list.add(top++);
        }
        
        for(int i=0;i<list.size();i++){
            int left=0,right=n-1;
            while(left<=right){
                int mid=left+(right-left>>1);
                if(matrix[list.get(i)][mid]==target) return true;
                if(matrix[list.get(i)][mid]<target){
                    left=mid+1;
                }
                else{
                    right=mid-1;
                }
            }
        }
        
        return false;
    }
}
```


```java
class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        
        int m=matrix.length,n=matrix[0].length;
        
        if(matrix[0][0]>target||matrix[m-1][n-1]<target) return false;
        
        int row=0,col=n-1;
        
        while(col >= 0 && row < m) {
            if(target == matrix[row][col]) {
                return true;
            } 
            else if(target < matrix[row][col]) {
                col--;
            } 
            else if(target > matrix[row][col]) {
                row++;
            }
        }
        return false;
    }
}
```