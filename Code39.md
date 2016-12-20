# Combination Sum

```Java
	//beats 84.16%
	public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        Arrays.sort(candidates);
        helper(candidates,0,target,res,cur);
        return res;
    }
    
    private void helper(int[] candidates,int begin,int target,List<List<Integer>> res,List<Integer> cur){
        if(target==0){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        for(int i=begin;i<candidates.length;i++){
            if(candidates[i]<=target){
                cur.add(candidates[i]);
                helper(candidates,i,target-candidates[i],res,cur);//<Warn>:����Ԫ�ؿ����ظ����ã�֮ǰ��дΪi+1
                cur.remove(cur.size()-1);
            }
            else break;
        }
    }
```

```Java
	//64.21%
	public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        Arrays.sort(candidates);
        helper(candidates,0,target,res,cur);
        return res;
    }
    
    private void helper(int[] candidates,int begin,int target,List<List<Integer>> res,List<Integer> cur){
        if(target==0){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        if(begin==candidates.length) return; //<Warn>:©�����
        
        helper(candidates,begin+1,target,res,cur);
        
        if(candidates[begin]<=target){
            cur.add(candidates[begin]);
            helper(candidates,begin,target-candidates[begin],res,cur);
            cur.remove(cur.size()-1);
        } 
        
    }
```