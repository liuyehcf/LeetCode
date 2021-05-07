# Kth Largest Element in an Array

```java
class Solution {
//beats 34.28%
    public int findKthLargest(int[] nums, int k) {
        return helper(nums,0,nums.length-1,nums.length+1-k);
    }
    
    private int helper(int[] nums,int p,int r,int k){
        if(p==r) {
            if(k!=1) throw new RuntimeException();
            return nums[p];
        }
        int q=partition(nums,p,r);
        int n=q-p+1;
        if(n==k) return nums[q];
        else if(n<k){
            return helper(nums,q+1,r,k-n);
        }
        else{
            return helper(nums,p,q-1,k);
        }
 
    }
    
    private int partition(int[] nums,int p,int r){
        int i=p-1;
        int x=nums[r];
        for(int j=p;j<r;j++){
            if(nums[j]<x){
                exchange(nums,++i,j);
            }
        }
        exchange(nums,++i,r);
        return i;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
   }
}
```