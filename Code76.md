# Minimum Window Substring


```java
//beats 80.37%
class Solution {
    public String minWindow(String s, String t) {
        int[] cntT=new int[128];
        for(char c:t.toCharArray()){
            cntT[c]++;
        }
        
        int count=0;
        int[] cntS=new int[128];
        int left=0,right=0;
        int min=Integer.MAX_VALUE;
        int[] range=new int[]{-1,-1};
        
        while(right<s.length()){
            if(++cntS[s.charAt(right)]<=cntT[s.charAt(right)]) count++;
            while(count==t.length()){
                if(right-left+1<min){
                    min=right-left+1;
                    range[0]=left;
                    range[1]=right+1;
                }
                if(--cntS[s.charAt(left)]<cntT[s.charAt(left)]){
                    count--;
                }
                left++;
            }
            right++;
        }
        
        if(range[0]==-1) return "";
        return s.substring(range[0],range[1]);
    }
}
```