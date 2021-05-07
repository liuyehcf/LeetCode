# Isomorphic Strings
* 仅仅计算出现次数是不行的，例如"aba"与"baa"
```java
class Solution {
    public boolean isIsomorphic(String s, String t) {
        int[] patterns=new int[128];
        int[] patternt=new int[128];
        Arrays.fill(patterns,-1);
        Arrays.fill(patternt,-1);
        
        if(s==null||t==null||s.length()!=t.length()) return false;
        
        for(int i=0;i<s.length();i++){
            char cs=s.charAt(i);
            char ct=t.charAt(i);
            if(patterns[cs]!=patternt[ct])return false;
            patterns[cs]=i;
            patternt[ct]=i;
        }
        return true;
    }
}
```