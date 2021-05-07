# First Missing Positive

```java
class Solution {
//beats 70.30%
class Solution {
    public int firstMissingPositive(int[] nums) {
        int boundary=nums.length-1;
        int i=0;
        while(i<=boundary){
            if(nums[i]<=0||nums[i]>boundary+1){
                exchange(nums,i,boundary--);
            }
            else{
                if(nums[i]==i+1){
                    i++;
                }
                else{
                    if(nums[nums[i]-1]==nums[i]){
                        exchange(nums,i,boundary--);
                    }
                    else{
                        exchange(nums,i,nums[i]-1);
                    }
                }
            }
        }
        return boundary+2;
    }
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
    
}
```