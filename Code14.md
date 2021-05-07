# Longest Common Prefix

```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs==null||strs.length==0) return "";
        StringBuilder sb=new StringBuilder();
        
        int pos=0;
        boolean flag=true;
        char c='\0';
        while(flag){
            if(c!='\0') sb.append(c);
            for(int i=0;i<strs.length;i++){
                if(i==0){
                    if(pos==strs[i].length()) {
                        flag=false;
                        break;
                    }
                    c=strs[i].charAt(pos);
                }
                else{
                    if(pos==strs[i].length()||strs[i].charAt(pos)!=c) {
                        flag=false;
                        break;
                    }
                }
            }
            pos++;
        }
        
        return sb.toString();
    }
}
```