# Regular Expression Matching


```Java
    //beats 83.69%
    public boolean isMatch(String s, String p) {
        boolean[][] dp=new boolean[s.length()+1][p.length()+1];
        dp[0][0]=true;
        for(int i=1;i<p.length()&&p.charAt(i)=='*';i+=2){
            dp[0][i+1]=true;
        }
        
        for(int i=1;i<=s.length();i++){
            for(int j=1;j<=p.length();j++){
                if(getChar(p,j+1-1)=='*'&&(getChar(p,j-1)=='.'||getChar(s,i-1)==getChar(p,j-1))){
                    dp[i][j+1]=dp[i-1][j+1]||dp[i][j-1];
                    j++;
                }
                else if(getChar(p,j+1-1)=='*'){
                    dp[i][j+1]=dp[i][j-1];
                    j++;
                }
                else if(getChar(p,j-1)=='.'||getChar(s,i-1)==getChar(p,j-1)){
                    dp[i][j]=dp[i-1][j-1];
                }
                else{
                    dp[i][j]=false;
                }
            }
        }
        return dp[s.length()][p.length()];
    }
    
    private char getChar(String s,int i){
        if(i<0||i>=s.length()) return '\0';
        return s.charAt(i);
    }
```