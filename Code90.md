# Subsets II

```java
//beats 36.53%
class Solution {
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int pos,List<List<Integer>> res,List<Integer> cur){
        res.add(new ArrayList<Integer>(cur));
        
        for(int start=pos;start<nums.length;start++){
            if(start>pos&&nums[start]==nums[start-1]) continue;
            cur.add(nums[start]);
            helper(nums,start+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
}
```