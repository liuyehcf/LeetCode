# Maximum Gap

**解题思路**：桶排序，用两个桶，一个存每个桶的最大值，一个存每个桶的最小值。放入桶中时，计算gap，然后最后计算各个桶之间gap

```java
class Solution {
    public int maximumGap(int[] nums) {
        if(nums.length<2) {
            return 0;
        }
        
        int minNum=Integer.MAX_VALUE;
        int maxNum=Integer.MIN_VALUE;
        
        for(int num:nums) {
            minNum=Math.min(minNum, num);
            maxNum=Math.max(maxNum, num);
        }
        
        if(minNum==maxNum) {
            return 0;
        }
        
        double bucketStep=(maxNum-minNum)/(double)nums.length;
        
        long[] minBuckets=new long[nums.length];
        long[] maxBuckets=new long[nums.length];
        
        Arrays.fill(minBuckets, Long.MAX_VALUE);
        Arrays.fill(maxBuckets, Long.MIN_VALUE);
        
        long max=Long.MIN_VALUE;
        
        for(int num:nums) {
            int bucketIndex=(int) ((num-minNum)/bucketStep);
            
            // boundary case
            if(bucketIndex==nums.length) {
                bucketIndex--;
            }
            
            if(num>maxBuckets[bucketIndex]) {
                if(maxBuckets[bucketIndex]!=Long.MIN_VALUE) {
                    max=Math.max(max, num-maxBuckets[bucketIndex]);
                }
                maxBuckets[bucketIndex]=num;
            }
            
            if(num<minBuckets[bucketIndex]) {
                if(minBuckets[bucketIndex]!=Long.MAX_VALUE) {
                   max=Math.max(max, minBuckets[bucketIndex]-num); 
                }
                minBuckets[bucketIndex]=num;
            }
        }
        
        long maxOfPreBucket=Long.MIN_VALUE;
        
        for(int i=0;i<nums.length;i++) {
            if(maxBuckets[i]==Long.MIN_VALUE){
                continue;
            }
            
            if(maxOfPreBucket!=Long.MIN_VALUE) {
                max=Math.max(max, minBuckets[i]-maxOfPreBucket);
            } 
        
            maxOfPreBucket=maxBuckets[i];
        }
        
        return (int)max;
    }
}
```