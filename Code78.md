# Subsets

* 错误的一版，会出现很多重复
* 错误的原因在于，这种方法的递归，其含义是：选择一个数作为第i个数(放到第i个位置上)
* 如果包含了空放，即例如第一个位置不放，第二个位置放1；第一个位置放1，第二个位置不放，这两个结果是完全一样的，于是导致了重复
```Java
	public List<List<Integer>> subsets(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int begin,List<List<Integer>> res,List<Integer> cur){
        if(begin==nums.length){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        
        for(int i=begin;i<nums.length;i++){
            if(i>begin&&nums[i]==nums[i-1]) continue;
            helper(nums,i+1,res,cur);//添加了这句导致了很多重复，放到循环外面也不行
            cur.add(nums[i]);
            helper(nums,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
```

* 如果有不包含这种可能，那么需要采用下面这种回溯方法
* 缺点是，数据源不能包含重复元素，否则选择的子集会重复
```Java	
	//beats 92.04%
	public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int begin,List<List<Integer>> res,List<Integer> cur){
        if(begin==nums.length){
            res.add(new ArrayList<Integer>(cur));
            return;
        }
        helper(nums,begin+1,res,cur);
        cur.add(nums[begin]);
        helper(nums,begin+1,res,cur);
        cur.remove(cur.size()-1);
    }
```


* 对于第一种方法的纠正(每一种状态都是可行解)

```Java
	//beats 30.92%
	public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int begin,List<List<Integer>> res,List<Integer> cur){
        res.add(new ArrayList<Integer>(cur)); //!!!!!!!关键!!!!!!!!!!!!!!!
        
        for(int i=begin;i<nums.length;i++){
            cur.add(nums[i]);
            helper(nums,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
```