# Valid Parentheses

```java
class Solution {
    public boolean isValid(String s) {
        LinkedList<Integer> stack=new LinkedList<Integer>();
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)=='('||s.charAt(i)=='['||s.charAt(i)=='{'){
                stack.push(i);
            }
            else{
                if(stack.isEmpty()) return false;
                int pos=stack.pop();
                if(!pair(s.charAt(pos),s.charAt(i))) return false;
            }
        }
        return stack.isEmpty();
    }
    
    private boolean pair(char c1,char c2){
        return c1=='('&&c2==')'||
                c1=='['&&c2==']'||
                c1=='{'&&c2=='}';
    }
}
```