# Subsets

* �����һ�棬����ֺܶ��ظ�
* �����ԭ�����ڣ����ַ����ĵݹ飬�京���ǣ�ѡ��һ������Ϊ��i����(�ŵ���i��λ����)
* ��������˿շţ��������һ��λ�ò��ţ��ڶ���λ�÷�1����һ��λ�÷�1���ڶ���λ�ò��ţ��������������ȫһ���ģ����ǵ������ظ�
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
            helper(nums,i+1,res,cur);//�������䵼���˺ܶ��ظ����ŵ�ѭ������Ҳ����
            cur.add(nums[i]);
            helper(nums,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
```

* ����в��������ֿ��ܣ���ô��Ҫ�����������ֻ��ݷ���
* ȱ���ǣ�����Դ���ܰ����ظ�Ԫ�أ�����ѡ����Ӽ����ظ�
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


* ���ڵ�һ�ַ����ľ���(ÿһ��״̬���ǿ��н�)

```Java
	//beats 30.92%
	public List<List<Integer>> subsets(int[] nums) {
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        List<Integer> cur=new ArrayList<Integer>();
        helper(nums,0,res,cur);
        return res;
    }
    
    private void helper(int[] nums,int begin,List<List<Integer>> res,List<Integer> cur){
        res.add(new ArrayList<Integer>(cur)); //!!!!!!!�ؼ�!!!!!!!!!!!!!!!
        
        for(int i=begin;i<nums.length;i++){
            cur.add(nums[i]);
            helper(nums,i+1,res,cur);
            cur.remove(cur.size()-1);
        }
    }
```