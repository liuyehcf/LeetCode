# Happy Number

```
//beats 30.23%
class Solution {
    public boolean isHappy(int n) {
        Set<Integer> set=new HashSet<Integer>();
        while(n>0&&n!=1){
            if(!set.add(n)) break;
            int temp=n;
            n=helper(n);
        }
        return n==1;
    }
    
    private int helper(int n){
        int[] nums=new int[10];
        int i=0;
        while(n!=0){
            nums[i++]=n%10;
            n/=10;
        }
        int res=0;
        for(int num:nums){
            res+=num*num;
        }
        return res;
    }
}
```