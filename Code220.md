# Contains Duplicate III

```Java
public class Solution {
    public boolean containsNearbyAlmostDuplicate(int[] nums, int k, int t) {
        if(nums==null||nums.length<2||t<0||k<0) return false;
        double max=Integer.MIN_VALUE;
        double min=Integer.MAX_VALUE;
        for(int num:nums){
            max=Math.max(max,num);
            min=Math.min(min,num);
        }
        
        double step=(t==0?1:t);
        
        int bucketNum=(int)Math.ceil((max-min)/step)+1;
        Map<Integer,List<Integer>> buckets=new HashMap<Integer,List<Integer>>();
        
        for(int i=0;i<nums.length;i++){
            if(i>k){
                double num=nums[i-k-1];
                int bucketIdx=(int)Math.ceil((num-min)/step);
                buckets.get(bucketIdx).clear();
            }
            int num=nums[i];
            int bucketIdx=(int)Math.ceil((num-min)/step);
            
            if(!buckets.containsKey(bucketIdx)) buckets.put(bucketIdx,new ArrayList<Integer>());
            if(buckets.get(bucketIdx).size()!=0) return true;
            buckets.get(bucketIdx).add(num);
            if(bucketIdx-1>=0&&
                buckets.containsKey(bucketIdx-1)&&
                buckets.get(bucketIdx-1).size()!=0&&
                num-buckets.get(bucketIdx-1).get(0)<=t) {
                    return true;
            }
            if(bucketIdx+1<bucketNum&&
                buckets.containsKey(bucketIdx+1)
                &&buckets.get(bucketIdx+1).size()!=0
                &&buckets.get(bucketIdx+1).get(0)-num<=t) {
                    return true;
            }
        }
        return false;
    }
}
```