# Contains Duplicate II

```Java
	//beats 9.17%
	public boolean containsNearbyDuplicate(int[] nums, int k) {
        Set<Integer> set=new HashSet<Integer>();
        int j=0;
        for(int i=0;i<nums.length;i++){
            if(i>k)set.remove(nums[j++]); //<Warn>:֮ǰд����i-k���Ⲣ���ԣ��ĳ�i-k-1����
            if(!set.add(nums[i])) return true;
        }
        return false;
    }
```