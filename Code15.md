# 3Sum

```java
class Solution {
//beats 13.98%
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        for(int i=0;i<nums.length;i++){
            if(i>0&&nums[i]==nums[i-1]) continue;
            for(int j=i+1;j<nums.length;j++){
                if(j>i+1&&nums[j]==nums[j-1]) continue;
                for(int k=j+1;k<nums.length;k++){
                    if(k>j+1&&nums[k]==nums[k-1]) continue;
                    if(nums[i]+nums[j]+nums[k]==0) 
                        res.add(Arrays.<Integer>asList(nums[i],nums[j],nums[k]));
                }
            }
        }
        return res;
   }
}
```


```java
class Solution {
//beats 18.87%
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> res=new ArrayList<List<Integer>>();
        for(int i=0;i<nums.length-2;i++){
            if(i>0&&nums[i]==nums[i-1]) continue;
            int left=i+1,right=nums.length-1;
            while(left<right){
                int sum=nums[i]+nums[left]+nums[right];
                if(sum<0){
                    left++;
                }
                else if(sum>0){
                    right--;
                }
                else{
                    res.add(Arrays.<Integer>asList(nums[i],nums[left],nums[right]));
                    left++;//<Warn>这两条是必须先写的，因为执行下面的循环完毕后，你不知道是否还需要递增/减
                    right--;
                    while(left<right&&nums[left]==nums[left-1]) left++;
                    while(left<right&&nums[right]==nums[right+1]) right--;
                }
            }
        }
        return res;
   }
}
```