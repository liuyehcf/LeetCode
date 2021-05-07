# Count and Say

```java
class Solution {
    public String countAndSay(int n) {
        String cur="1";
        while(n>1){
            cur=say(cur);
            n--;
        }
        return cur;
    }
    
    private String say(String s){
        StringBuilder sb=new StringBuilder();
        int cnt=1;
        char preVal=s.charAt(0);
        
        for(int i=1;i<s.length();i++){
            char curVal=s.charAt(i);
            if(curVal==preVal){
                cnt++;
            }
            else{
                sb.append(cnt).append(preVal);
                cnt=1;
                preVal=curVal;
            }
        }
        sb.append(cnt).append(preVal);
        return sb.toString();
    }
}
```