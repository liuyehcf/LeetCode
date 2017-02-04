# Find All Duplicates in an Array

```Java
	//beats 16.71%
	public List<Integer> findDuplicates(int[] nums) {
        Set<Integer> set=new HashSet<Integer>();//<Warn>:刚开始是ArrayList，这样会导致重复
        int iter=0;
        while(iter<nums.length){
            if(nums[iter]==iter+1){
                iter++;
            }
            else if(nums[nums[iter]-1]==nums[iter]){
                set.add(nums[iter]);
                iter++;
            }
            else{
                exchange(nums,iter,nums[iter]-1);
            }
        }
        return new ArrayList<Integer>(set);
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```