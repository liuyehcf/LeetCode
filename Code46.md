#  Permutations

```Java
//beats 58.84%
public class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        if(nums==null||nums.length==0) return res;
        List<Integer> cur=new ArrayList<Integer>();
        boolean[] isUsed=new boolean[nums.length];
        helper(nums,res,cur,isUsed,0);
        return res;
    }
    
    private void helper(int[] nums,List<List<Integer>> res,List<Integer> cur,boolean[] isUsed,int pos){
        if(pos==nums.length){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        for(int i=0;i<nums.length;i++){
            if(isUsed[i]) continue;
            cur.add(nums[i]);
            isUsed[i]=true;
            helper(nums,res,cur,isUsed,pos+1);
            isUsed[i]=false;
            cur.remove(cur.size()-1);
        }
    }
}
```