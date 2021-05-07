# Burst Balloons(����ը�����ֵ)

* ���һ��ը˭�����һ��ը��Ԫ�ز�Ӱ��֮ǰը�Ľ��
* ����һ������left [a1 a2 a3 ... an] right,������ըai����ô��ʱ�Ľ������left*ai*right+dp[a1][ai-1]+dp[ai+1][an]

```java
class Solution {
//beats 9.22%
    public int maxCoins(int[] nums) {
        if(nums==null||nums.length==0) return 0;
        int n=nums.length;
        int[][] dp=new int[n][n];
        for(int len=1;len<=n;len++){
            for(int start=0;start<n-len+1;start++){
                int end=start+len-1;
                for(int middle=start;middle<=end;middle++){
                    dp[start][end]=Math.max(get2(nums,start-1)*nums[middle]*get2(nums,end+1)+get(dp,start,middle-1)+get(dp,middle+1,end),dp[start][end]);
                }
            }
        }
        return dp[0][n-1];
    }
    
    private int get(int[][] dp,int start,int end){
        if(start>end) return 0;
        return dp[start][end];
    }
    
    private int get2(int[] nums,int i){
        if(i<0||i>=nums.length)return 1;
        return nums[i];
   }
}
```