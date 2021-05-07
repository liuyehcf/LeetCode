
# Summary Ranges


```java
class Solution {
//beats 7.06%
    public List<String> summaryRanges(int[] nums) {
        List<String> res=new ArrayList<String>();
        if(nums==null||nums.length==0) return res;
        
        int begin=0;
        int iter=0;
        while(iter<nums.length){
            if(iter+1<nums.length&&nums[iter+1]!=nums[iter]+1){
                res.add(buildString(nums,begin,iter));
                begin=iter+1;
            }
            iter++;
        }
        res.add(buildString(nums,begin,iter-1));
        return res;
    }
    
    public String buildString(int[] nums,int left,int right){
        StringBuilder sb=new StringBuilder();
        if(left==right){
            sb.append(Integer.toString(nums[left]));
        }
        else{
            sb.append(Integer.toString(nums[left])).append("->").append(Integer.toString(nums[right]));
        }
        return sb.toString();
   }
}
```


```java
//beats 67.80%
class Solution {
    public List<String> summaryRanges(int[] nums) {
        List<String> res=new ArrayList<String>();
        if(nums==null||nums.length==0) return res;
        
        int left=nums[0];

        for(int i=1;i<nums.length;i++){
            if(nums[i]!=nums[i-1]+1){
                if(left==nums[i-1]){
                    res.add(""+left);
                }
                else{
                    res.add(left+"->"+nums[i-1]);
                }
                left=nums[i];
            }
        }
        
        if(nums[nums.length-1]==left){
            res.add(""+left);
        }
        else{
            res.add(left+"->"+nums[nums.length-1]);
        }
        return res;
    }
}
```