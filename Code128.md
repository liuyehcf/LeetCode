# Longest Consecutive Sequence

```Java
	public int longestConsecutive(int[] nums) {
        int res=0;
        Map<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int num:nums){
            if(map.containsKey(num))continue;
            int leftSize=map.containsKey(num-1)?map.get(num-1):0;
            int rightSize=map.containsKey(num+1)?map.get(num+1):0;
            int size=leftSize+rightSize+1;
            map.put(num-leftSize,size);
            map.put(num,size);//<Warn>:漏了这句,由于通过map是否包含num来判断重复，因此加上，反正无害
            map.put(num+rightSize,size);
            res=Math.max(res,size);
        }
        return res;
    }
```