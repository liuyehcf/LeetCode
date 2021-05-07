# Contains Duplicate II

```Java
    //beats 9.17%
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        Set<Integer> set=new HashSet<Integer>();
        int j=0;
        for(int i=0;i<nums.length;i++){
            if(i>k)set.remove(nums[j++]); //<Warn>:之前写的是i-k，这并不对，改成i-k-1才行
            if(!set.add(nums[i])) return true;
        }
        return false;
    }
```