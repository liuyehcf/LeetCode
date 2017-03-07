# Shortest Palindrome


```Java
	//beats 34.5%
	public String shortestPalindrome(String s) {
        if(s.length()==0) return s;
        String ss=s+"&"+new StringBuilder(s).reverse().toString();
        
        int[] pi=new int[ss.length()];
        
        pi[0]=0;
        int k=0;
        
        for(int i=1;i<ss.length();i++){
            while(k>0&&ss.charAt(k+1-1)!=ss.charAt(i)){
                k=pi[k-1];
            }
            if(ss.charAt(k+1-1)==ss.charAt(i)){
                k++;
            }
            pi[i]=k;
        }
        return new StringBuilder(s.substring(pi[ss.length()-1])).reverse().toString()+s;
    }
```