# Longest Valid Parentheses

```Java
//beats 78.15%
public class Solution {
    public int longestValidParentheses(String s) {
        if(s==null||s.length()==0) return 0;
        if(s.length()<2) return 0;
        
        int[] dp=new int[s.length()];
        int res=Integer.MIN_VALUE;
        
        for(int i=1;i<s.length();i++){
            if(s.charAt(i)=='(') dp[i]=0;
            else{
                int len=dp[i-1];
                int mid=i-len-1;
                if(mid>=0&&s.charAt(mid)=='('){
                    dp[i]=dp[i-1]+2;
                    if(mid>0){
                        dp[i]+=dp[mid-1];
                    }
                }
            }
            res=Math.max(res,dp[i]);
        }
        return res;
    }
}
```