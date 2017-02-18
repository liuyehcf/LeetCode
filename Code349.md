# Intersection of Two Arrays(两个数组的交集)

* 用set来除重复即可
```Java
	public int[] intersection(int[] nums1, int[] nums2) {
        Set<Integer> set=new HashSet<Integer>();
        for(int num:nums1)
            set.add(num);
        
        Set<Integer> intersection=new HashSet<Integer>();
        for(int num:nums2)
            if(set.contains(num))
            intersection.add(num);
        
        int[] res=new int[intersection.size()];
        int iter=0;
        for(int num:intersection){
            res[iter++]=num;
        }
        return res;
    }
```