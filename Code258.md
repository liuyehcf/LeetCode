# Add Digits


```Java
//beats 24.54%
public class Solution {
    public int addDigits(int num) {
        while(num>=10){
            num=add(num);
        }
        return num;
    }
    
    private int add(int num){
        int res=0;
        while(num!=0){
            res+=num%10;
            num/=10;
        }
        return res;
    }
}
```