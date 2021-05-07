# Basic Calculator

```java
//beats 33.17%
class Solution {
    public int calculate(String s) {
        LinkedList<Integer> stackPre=new LinkedList<Integer>();
        LinkedList<Integer> stackRes=new LinkedList<Integer>();
        LinkedList<Character> stackSign=new LinkedList<Character>();
        
        char sign='+';
        int pre=0;
        int res=0;
        
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(c==' ')continue;
            else if(Character.isDigit(c)){
                int curValue=0;
                while(i<s.length()&&Character.isDigit(s.charAt(i))){
                    curValue=curValue*10+(s.charAt(i++)-'0');
                }
                if(sign=='+'){
                    res+=pre;
                    pre=curValue;
                }
                else if(sign=='-'){
                    res+=pre;
                    pre=-curValue;
                }
                i--;
            }
            else if(c=='('){
                stackPre.push(pre);
                stackRes.push(res);
                stackSign.push(sign);
                
                sign='+';
                pre=0;
                res=0;
            }
            else if(c==')'){
                res=res+pre;
                
                int peekPre=stackPre.pop();
                int peekRes=stackRes.pop();
                char peekSign=stackSign.pop();
                
                if(peekSign=='+'){
                    peekRes+=peekPre;
                    pre=res;
                    res=peekRes;
                }
                else if(peekSign=='-'){
                    peekRes+=peekPre;
                    pre=-res;
                    res=peekRes;
                }
            }
            else{
                sign=c;
            }
        }
        
        return res+pre;
    }
}
```