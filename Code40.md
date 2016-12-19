# Combination Sum II

```Java
	//beats 43.23%
	public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        Arrays.sort(candidates);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(candidates,0,target,res,cur);
        return res;
    }
    
    private void helper(int[] candidates,int begin,int target,List<List<Integer>> res,List<Integer> cur){
        if(target==0){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        
        for(int i=begin;i<candidates.length;i++){
            if(i>begin&&candidates[i]==candidates[i-1]) continue;
            if(candidates[i]<=target){
                cur.add(candidates[i]);
                helper(candidates,i+1,target-candidates[i],res,cur);
                cur.remove(cur.size()-1);
            }
            else break;
        }
    }
```