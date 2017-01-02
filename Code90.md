# Subsets II


```Java
	//beats 75.13%
	public List<List<Integer>> subsetsWithDup(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int begin,List<List<Integer>> res,List<Integer> cur){
        res.add(new ArrayList<Integer>(cur));
        
        for(int i=begin;i<nums.length;i++){
            if(i>begin&&nums[i]==nums[i-1]) continue;
            cur.add(nums[i]);
            helper(nums,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
```