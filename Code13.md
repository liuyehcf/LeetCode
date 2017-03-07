# Roman to Integer

```Java
//beats 91.33%
public class Solution {
    public int romanToInt(String s) {
        int res=0;
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)=='M'){
                res+=1000;
            }
            else if(s.charAt(i)=='D'){
                res+=500;
            }
            else if(s.charAt(i)=='L'){
                res+=50;
            }
            else if(s.charAt(i)=='V'){
                res+=5;
            }
            else if(s.charAt(i)=='C'){
                if(i+1<s.length()&&(s.charAt(i+1)=='D'||s.charAt(i+1)=='M')){
                    res-=100;
                }
                else{
                    res+=100;
                }
            }
            else if(s.charAt(i)=='X'){
                if(i+1<s.length()&&(s.charAt(i+1)=='L'||s.charAt(i+1)=='C')){
                    res-=10;
                }
                else{
                    res+=10;
                }
            }
            else if(s.charAt(i)=='I'){
                if(i+1<s.length()&&(s.charAt(i+1)=='V'||s.charAt(i+1)=='X')){
                    res-=1;
                }
                else{
                    res+=1;
                }
            }
        }
        return res;
    }
}
```