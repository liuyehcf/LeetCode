# Combination Sum II

```Java
    //beats 43.23%
    public class Solution {
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        Arrays.sort(candidates);
        
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        
        List<Integer> cur=new ArrayList<Integer>();
        
        helper(candidates,0,target,res,cur);
        
        return res;
    }
    
    private void helper(int[] candidates,int pos,int target,List<List<Integer>> res,List<Integer> cur){
        if(target==0){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        
        for(int start=pos;start<candidates.length;start++){
            if(candidates[start]>target) break;
            if(start>pos&&candidates[start]==candidates[start-1]) continue;
            cur.add(candidates[start]);
            helper(candidates,start+1,target-candidates[start],res,cur);
            cur.remove(cur.size()-1);
        }
    }
}
```