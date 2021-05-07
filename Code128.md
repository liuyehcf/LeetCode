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
            map.put(num,size);//<Warn>:©�����,����ͨ��map�Ƿ����num���ж��ظ�����˼��ϣ������޺�
            map.put(num+rightSize,size);
            res=Math.max(res,size);
        }
        return res;
    }
```