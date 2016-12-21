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

* ���ַ����ڲ���һ�����ڵ�������������·�������Ƕ������ֲ�һ�����ڵ��������Բ������ƵĽṹ
* ѭ�������ĸı䣬���������±�ı����ʽ������΢��
```Java
	//beats 68.22%
	public boolean searchMatrix(int[][] matrix, int target) {
        if(matrix==null||matrix.length==0||matrix[0].length==0) return false;
        int m=matrix.length,n=matrix[0].length;
        
        //���ȶ��ַ�ȷ�����ڵ���
        int row=-1;
        int top=0,bottom=m-1;
        while(top<bottom-1){//��������top�ĸ�ֵ����ϵ����bottom=top+1ʱ���������else��֧����ôѭ���ǳ���ȥ��
            int mid=top+(bottom-top>>1);
            if(matrix[mid][0]>target){
                bottom=mid-1;
            }
            else{
                top=mid;//����ǳ���Ҫ,���Բ���дmid+1����Ϊ����С��target,targetҲ���ܴ��ڸ��еķ�Χ��
            }
        }
        
        if(matrix[bottom][0]<=target) row=bottom;
        else row=top;
        
        //������ҵ����У��ö��ַ�ȷ��������
        
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
        
        //��ȥ���ᵽ���ĸ����ǽ����
        if(right>=0&&matrix[row][right]==target) return true;
        if(left<=n-1&&matrix[row][left]==target) return true;
        
        return false;
    }
```