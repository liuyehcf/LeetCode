# Wildcard Matching

```Java
//beats 57.91%
public class Solution {
    public boolean isMatch(String s, String p) {
        boolean[][] dp=new boolean[s.length()+1][p.length()+1];
        
        dp[0][0]=true;
        
        int i=0;
        while(i<p.length()&&p.charAt(i)=='*'){
            dp[0][i+1]=true;
            i++;
        }
        
        for(i=1;i<=s.length();i++){
            for(int j=1;j<=p.length();j++){
                if(p.charAt(j-1)=='*'){
                    dp[i][j]=dp[i][j-1]||dp[i-1][j];
                }
                else if(p.charAt(j-1)=='?'||s.charAt(i-1)==p.charAt(j-1)){
                    dp[i][j]=dp[i-1][j-1];
                }
                else{
                    dp[i][j]=false;
                }
            }
        }
        
        return dp[s.length()][p.length()];
    }
}
```