# Merge Sorted Array

```Java
	//5.72%
	public void merge(int[] nums1, int m, int[] nums2, int n) {
        int iter1=m-1,iter2=n-1;
        int iter=nums1.length-1;
        
        while(iter1>=0&&iter2>=0){
            if(nums1[iter1]>=nums2[iter2]){
                nums1[iter--]=nums1[iter1--];
            }
            else{
                nums1[iter--]=nums2[iter2--];
            }
        }
        
        while(iter1>=0){
            nums1[iter--]=nums1[iter1--];
        }
        
        while(iter2>=0){
            nums1[iter--]=nums2[iter2--];
        }
    }
```