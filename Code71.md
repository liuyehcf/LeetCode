# Simplify Path


```Java
//beats 58.76%
public class Solution {
    public String simplifyPath(String path) {
        if(path==null||path.length()==0) return path;
        
        LinkedList<String> stack=new LinkedList<String>();
        String[] strs=path.split("/");
        for(String s:strs){
            if(s.equals("")) continue;
            else if(s.equals(".")) {
                continue;
            }
            else if(s.equals("..")) {
                if(stack.isEmpty()) continue;
                stack.pop();
            }
            else{
                stack.push(s);
            }
        }
        
        StringBuilder sb=new StringBuilder();
        while(!stack.isEmpty()){
            sb.insert(0,"/"+stack.pop());
        }
        if(sb.length()==0) sb.append("/");
        return sb.toString();
    }
}
```