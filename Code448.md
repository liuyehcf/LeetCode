# Find All Numbers Disappeared in an Array

```Java
	//beats 20.75%
	public List<Integer> findDisappearedNumbers(int[] nums) {
        List<Integer> res=new ArrayList<Integer>();
        
        int iter=0;
        while(iter<nums.length){
            if(nums[iter]==-1) {//<Warn>:missing this
                iter++;
            }
            else if(nums[iter]==iter+1){
                iter++;
            }
            else if(nums[nums[iter]-1]==nums[iter]){
                if(iter==nums[iter]-1) iter++;
                else nums[iter]=-1;
            }
            else{
                exchange(nums,iter,nums[iter]-1);
            }
        }
        
        for(int i=0;i<nums.length;i++){
            if(nums[i]==-1) res.add(i+1);
        }
        
        return res;
    }
    
    private void exchange(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }
```