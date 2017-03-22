# Search a 2D Matrix

* 二分法
```Java
//beats 8.35%
public class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        int m=matrix.length;
        int n=matrix[0].length;
        
        int top=0,bottom=m-1;
        
        if(matrix[bottom][n-1]<target) return false;
        
        while(top<=bottom){
            int mid=top+(bottom-top>>1);
            if(matrix[mid][n-1]==target) return true;
            else if(matrix[mid][n-1]<target){
                top=mid+1;
            }
            else{
                bottom=mid-1;
            }
        }
        
        if(matrix[top][0]>target) return false;
        
        int left=0,right=n-1;
        while(left<=right){
            int mid=left+(right-left>>1);
            if(matrix[top][mid]==target) return true;
            else if(matrix[top][mid]<target){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        
        return false;
    }
}
```

* brilliant solution
```Java
//#########^^^^^^^^^
//#########^^^^^^^^^
//#########^^^^^^^^^
//########$+++++++++
//********++++++++++
//********++++++++++
//********++++++++++
//当$<target,那么由#组成的区域(包括$)都会比target小，因此该区域可以舍弃
//当$>target,那么由+组成的区域(包括$)都会比target大，因此该区域可以舍弃
//但是这样看起来要找的数可能还会存在于^组成的区域中，但实际上这是不可能的，^是由#和和+共同组成的区域
//因此要找的数只可能存在于*中
public class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        int m=matrix.length;
        int n=matrix[0].length;
        
        int row=0,col=n-1;
        while(row<m&&col>=0){
            if(matrix[row][col]==target) return true;
            else if(matrix[row][col]>target){
                col--;//例如4*4的数组matrix,matrix[2][2]<target,那么matrix[3][2]>matrix[2][2]>target,因此col>=2都不可能有与target相同的，因此递减即可
            }
            else 
                row++;//同理，例如4*4的数组matrix,matrix[2][2]>target
        }
        return false;
    }
}
```