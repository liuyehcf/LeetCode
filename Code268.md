# Missing Number

```Java
	//beats 15.65%
	public int missingNumber(int[] nums) {
        int boundary=nums.length-1;
        int iter=0;
        while(iter<nums.length&&iter<=boundary){//<Warn>:��������iter<=boundary
            if(nums[iter]==iter){
                iter++;
            }
            else if(nums[iter]<0||nums[iter]>boundary){
                exchange(nums,iter,boundary--);
            }
            else{
                exchange(nums,iter,nums[iter]);
            }
        }
        return boundary+1;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```