#

* 排序，每个位置取值去除重复即可
```Java
//beats 19.48%
public class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        if(nums==null||nums.length==0) return res;
        Arrays.sort(nums);
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
        
        Integer pre=null;
        for(int i=0;i<nums.length;i++){
            if(isUsed[i]) continue;
            if(pre!=null&&nums[i]==pre) continue;
            pre=nums[i];
            cur.add(nums[i]);
            isUsed[i]=true;
            helper(nums,res,cur,isUsed,pos+1);
            isUsed[i]=false;
            cur.remove(cur.size()-1);
        }
    }
}
```


* 另一种思路，不排序，也可以去重复
```Java
//beats 17.28%
public class Solution {
    public List<List<Integer>> permuteUnique(int[] nums) {
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
        
        Set<Integer> set=new HashSet<Integer>();
        for(int i=0;i<nums.length;i++){
            if(isUsed[i]) continue;
            if(!set.add(nums[i])) continue;
            cur.add(nums[i]);
            isUsed[i]=true;
            helper(nums,res,cur,isUsed,pos+1);
            isUsed[i]=false;
            cur.remove(cur.size()-1);
        }
    }
}
```