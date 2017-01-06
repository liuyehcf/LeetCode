# Rotate Array

```Java
	//beats 6.04%
	public void rotate(int[] nums, int k) {
        int leftSize=k%nums.length;//<Warn>:×¢ÒâÕâ¾ä
        inverse(nums,0,nums.length-1);
        inverse(nums,0,leftSize-1);
        inverse(nums,leftSize,nums.length-1);
    }
    
    private void inverse(int[] nums,int begin,int end){
        for(int i=begin;i<=begin+(end-begin>>1);i++){
            int temp=nums[i];
            nums[i]=nums[end-(i-begin)];
            nums[end-(i-begin)]=temp;
        }
    }
```