# Longest Palindromic Substring 
 
* 动态规划
```Java
	//beats 13.47%
	public String longestPalindrome(String s) {
        if(s==null||s.length()==0) return "";
        boolean[][] dp=new boolean[s.length()][s.length()];
        
        String res="";
        
        for(int right=0;right<s.length();right++){
            for(int left=0;left<=right;left++){
                if(s.charAt(left)==s.charAt(right)){
                    if(left+1>right-1||dp[left+1][right-1]){
                        dp[left][right]=true;
                        if(res.length()<right-left+1) res=s.substring(left,right+1);
                    }
                }
            }
        }
        return res;
    }
	
	
	public String longestPalindrome(String s) {
        if(s==null||s.length()==0) return "";
        boolean[][] dp=new boolean[s.length()][s.length()];
        for(int i=0;i<s.length();i++){
            dp[i][i]=true;
        }
        String res=s.substring(0,1);
        for(int len=2;len<=s.length();len++){
            for(int start=0;start<=s.length()-len;start++){
                int end=start+len-1;
                if(s.charAt(start)==s.charAt(end)){
                    if(start+1>end-1||dp[start+1][end-1]){
                        dp[start][end]=true;
                        if(res.length()<end-start+1)
                            res=s.substring(start,end+1);
                    }
                }
            }
        }
        return res;
    }
```

* else
```Java
	//beats 50%
	public String longestPalindrome(String s) {
        String res="";
        for(int i=0;i<s.length();i++){
            String tem1=helper(s,i,i);
            if(i<s.length()-1){
                String tem2=helper(s,i,i+1);
                if(tem1.length()<tem2.length()) tem1=tem2;
            }
            if(res.length()<tem1.length()) res=tem1;
        }
        return res;
    }
    
    private String helper(String s,int left,int right){
        while(left>=0&&right<s.length()&&s.charAt(left)==s.charAt(right)){
            left--;
            right++;
        }
        if(right-1<left+1) return "";
        return s.substring(left+1,right-1+1);
    }
```


* 改进过的
```Java
	//beats 87.61%
	int[] range;
    public String longestPalindrome(String s) {
        if(s==null||s.length()==0) return "";
        range=new int[2];
        for(int i=0;i<s.length();i++){
            helper(s,i,i);
            helper(s,i,i+1);
        }
        return s.substring(range[0],range[1]+1);
    }
    
    private void helper(String s,int left,int right){
        while(left>=0&&right<s.length()&&s.charAt(left)==s.charAt(right)){
            left--;
            right++;
        }
        if((right-1)-(left+1)+1>range[1]-range[0]+1){
            range[0]=left+1;
            range[1]=right-1;
        }
    }
```