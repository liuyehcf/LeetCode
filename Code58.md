# Length of Last Word

```java
//beats 74.63%
class Solution {
    public int lengthOfLastWord(String s) {
        if(s==null) return 0;
        s=s.trim();
        if(s.length()==0) return 0;
        
        int res=0;
        
        for(int i=s.length()-1;i>=0;i--){
            char c=s.charAt(i);
            if(c!=' ') res++;
            else break;
        }
        
        return res;
    }
}
```