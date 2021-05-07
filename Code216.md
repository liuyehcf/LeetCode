# Combination Sum III

```java
class Solution {
//beats 52.94%
    public List<List<Integer>> combinationSum3(int k, int n) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(k,n,0,1,res,cur);
        return res;
    }
    
    private void helper(int k,int n,int index,int begin,List<List<Integer>> res,List<Integer> cur){
        if(index==k){
            if(n==0) res.add(new ArrayList<Integer>(cur));
            return ;
        }
        
        for(int i=begin;i<=9;i++){
            if(i>n) return;
            cur.add(i);
            helper(k,n-i,index+1,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
   }
}
```