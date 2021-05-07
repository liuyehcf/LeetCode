# Contains Duplicate

```java
class Solution {
//beats 85.68%
    public boolean containsDuplicate(int[] nums) {
        Arrays.sort(nums);
        for(int i=1;i<nums.length;i++){
            if(nums[i]==nums[i-1]) return true;
        }
        return false;
   }
}
```


```java
class Solution {
//beats 44.43%
    public boolean containsDuplicate(int[] nums) {
        Set<Integer> set=new HashSet<Integer>();
        for(int num:nums){
            if(!set.add(num)){
                return true;
            }
        }
        return false;
   }
}
```