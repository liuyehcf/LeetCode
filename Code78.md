# Subsets


```java
class Solution {
    public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int pos,List<List<Integer>> res,List<Integer> cur){
        res.add(new ArrayList<Integer>(cur));//关键
        
        for(int start=pos;start<nums.length;start++){
            cur.add(nums[start]);
            helper(nums,start+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
}
```