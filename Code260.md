# Single Number III

```java
class Solution {
    public int[] singleNumber(int[] nums) {
        if(nums==null||nums.length<2) throw new RuntimeException();
        int val1=nums[0];
        for(int i=1;i<nums.length;i++){
            val1^=nums[i];
        }
        
        int offset=0;
        while(offset<32){
            if((val1&(1<<offset))!=0){
                break;
            }
            offset++;
        }
        
        int special=1<<offset;
        //System.out.println(offset);
        
        Integer res1=null,res2=null;
        for(int num:nums){
            if((num&special)==0){
                if(res1==null){
                    res1=num;
                }
                else{
                    res1=res1^num;
                }
            }
            else{
                if(res2==null){
                    res2=num;
                }
                else{
                    res2=res2^num;
                }
            }
        }
        
        return new int[]{res1,res2};
    }
}
```