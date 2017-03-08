# Basic Calculator II


```Java
public class Solution {
    public int calculate(String s) {
        int pre=0;
        int res=0;
        char sign='+';
        
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)==' ') continue;
            else if(Character.isDigit(s.charAt(i))){
                int curVal=0;
                while(i<s.length()&&Character.isDigit(s.charAt(i))){
                    curVal=curVal*10+(s.charAt(i++)-'0');
                }
                i--;
                if(sign=='+'){
                    res+=pre;
                    pre=curVal;
                }else if(sign=='-'){
                    res+=pre;
                    pre=-curVal;
                }else if(sign=='*'){
                    pre*=curVal;
                }else if(sign=='/'){
                    pre/=curVal;
                }else{
                    throw new RuntimeException();
                }
            }
            else{
                sign=s.charAt(i);
            }
            
        }
        return res+pre;

    }
}
```