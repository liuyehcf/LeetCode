# Combinations


```Java
//beats 56.71%
public class Solution {
    public List<List<Integer>> combine(int n, int k) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(n,k,1,0,res,cur);
        return res;
    }
    
    private void helper(int n,int k,int pos,int index,List<List<Integer>> res,List<Integer> cur){
        if(index==k){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        
        for(int start=pos;start<=n;start++){
            cur.add(start);
            helper(n,k,start+1,index+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
}
```