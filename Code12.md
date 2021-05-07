# Integer to Roman

```java
class Solution {
    public String intToRoman(int num) {
        String[][] convertTable={
            {"","I","II","III","IV","V","VI","VII","VIII","IX"},
            {"","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"},
            {"","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"},
            {"","M","MM","MMM"},
        };
        
        StringBuilder sb=new StringBuilder();
        
        int thousands=num/1000;
        num=num%1000;
        sb.append(convertTable[3][thousands]);
        
        int hundreds=num/100;
        num=num%100;
        sb.append(convertTable[2][hundreds]);
        
        int tens=num/10;
        num=num%10;
        sb.append(convertTable[1][tens]);
        
        sb.append(convertTable[0][num]);
        
        return sb.toString();
    }
}
```