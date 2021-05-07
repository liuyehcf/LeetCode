# Search in Rotated Sorted Array

* 二分法
```java
//beats 58.13%
class Solution {
    public int search(int[] nums, int target) {
        if(nums==null||nums.length==0) return -1;
        int left=0,right=nums.length-1;
        
        if(nums[left]>nums[right]){
            while(left<right){
                if(nums[left]<nums[right]) break;
                int mid=left+(right-left>>1);
                if(nums[mid]<nums[left]){
                    right=mid;
                }
                else{
                    left=mid+1;
                }
            }
            int special=left;

            int leftRes=helper(nums,0,special-1,target);
            int rightRes=helper(nums,special,nums.length-1,target);
            if(leftRes>=0) return leftRes;
            else if(rightRes>=0) return rightRes;
            else return -1;
        }
        else{
            return helper(nums,0,nums.length-1,target);
        }
        
        
    }
    
    private int helper(int[] nums,int left,int right,int target){
        if(target<nums[left]||target>nums[right]) return -1;
        while(left<=right){
            int mid=left+(right-left>>1);
            if(nums[mid]==target) return mid;
            else if(nums[mid]<target){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        return -1;
    }
}
```

* 同上，换种方式找临界点
```java
class Solution {
    public int search(int[] nums, int target) {
        if(nums==null||nums.length==0) return -1;
        int left=0,right=nums.length-1;
        
        if(nums[left]>nums[right]){
            while(left<right){
                int mid=left+(right-left>>1);
                if(nums[mid]>nums[right]){
                    left=mid+1;
                }
                else{
                    right=mid;
                }
            }
            int special=left;

            int leftRes=helper(nums,0,special-1,target);
            int rightRes=helper(nums,special,nums.length-1,target);
            if(leftRes>=0) return leftRes;
            else if(rightRes>=0) return rightRes;
            else return -1;
        }
        else{
            return helper(nums,0,nums.length-1,target);
        }
        
        
    }
    
    private int helper(int[] nums,int left,int right,int target){
        if(target<nums[left]||target>nums[right]) return -1;
        while(left<=right){
            int mid=left+(right-left>>1);
            if(nums[mid]==target) return mid;
            else if(nums[mid]<target){
                left=mid+1;
            }
            else{
                right=mid-1;
            }
        }
        return -1;
    }
}
```


```java
class Solution {
    public int search(int[] nums, int target) {
        int n=nums.length;
        int lo=0,hi=n-1;
        // find the index of the smallest value using binary search.
        // Loop will terminate since mid < hi, and lo or hi will shrink by at least 1.
        // Proof by contradiction that mid < hi: if mid==hi, then lo==hi and loop would have been terminated.
        while(lo<hi){
            int mid=(lo+hi)/2;
            if(nums[mid]>nums[hi]) lo=mid+1;
            else hi=mid;
        }
        // lo==hi is the index of the smallest value and also the number of places rotated.
        int rot=lo;
        lo=0;hi=n-1;
        // The usual binary search and accounting for rotation.
        while(lo<=hi){
            int mid=(lo+hi)/2;
            int realmid=(mid+rot)%n;
            if(nums[realmid]==target)return realmid;
            if(nums[realmid]<target)lo=mid+1;
            else hi=mid-1;
        }
        return -1;
    }    
}
```