# Intersection of Two Arrays II(��������Ľ������ɰ����ظ�)

* ����һ��������ͬ��set�Ͳ�������

```java
class Solution {
public int[] intersect(int[] nums1, int[] nums2) {
        Arrays.sort(nums1);
        Arrays.sort(nums2);
        
        List<Integer> intersection=new ArrayList<Integer>();
        int iter1=0,iter2=0;
        while(iter1<nums1.length&&iter2<nums2.length){
            if(nums1[iter1]==nums2[iter2]){
                intersection.add(nums1[iter1]);
                iter1++;
                iter2++;
            }else if(nums1[iter1]<nums2[iter2]){
                iter1++;
            }else{
                iter2++;
            }
        }
        int iter=0;
        int[] res=new int[intersection.size()];
        for(int num:intersection){
            res[iter++]=num;
        }
        return res;
   }
}
```