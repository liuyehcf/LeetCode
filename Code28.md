# Implement strStr()

* KMP Algorithm
```Java
//beats 8.76%
public class Solution {
    public int strStr(String s, String pattern) {
        if(pattern.length()==0)  return 0;
        if(s.length()==0) return -1;
        int[] pi=new int[pattern.length()];
        pi[0]=0;
        
        //initialize pi
        int k=0;
        for(int i=1;i<pattern.length();i++){
            while(k>0&&pattern.charAt(k+1-1)!=pattern.charAt(i)){
                k=pi[k-1];
            }
            if(pattern.charAt(k+1-1)==pattern.charAt(i)){
                k++;
            }
            pi[i]=k;
        }
        
        k=0;
        for(int i=0;i<s.length();i++){
            while(k>0&&pattern.charAt(k+1-1)!=s.charAt(i)){
                k=pi[k-1];
            }
            if(pattern.charAt(k+1-1)==s.charAt(i)){
                k++;
            }
            if(k==pattern.length()) return i-pattern.length()+1;
        }
        return -1;
    }
}
```