
# Summary Ranges


```Java
	//beats 7.06%
	public List<String> summaryRanges(int[] nums) {
        List<String> res=new ArrayList<String>();
        if(nums==null||nums.length==0) return res;
        
        int begin=0;
        int iter=0;
        while(iter<nums.length){
            if(iter+1<nums.length&&nums[iter+1]!=nums[iter]+1){
                res.add(buildString(nums,begin,iter));
                begin=iter+1;
            }
            iter++;
        }
        res.add(buildString(nums,begin,iter-1));
        return res;
    }
    
    public String buildString(int[] nums,int left,int right){
        StringBuilder sb=new StringBuilder();
        if(left==right){
            sb.append(Integer.toString(nums[left]));
        }
        else{
            sb.append(Integer.toString(nums[left])).append("->").append(Integer.toString(nums[right]));
        }
        return sb.toString();
    }
```