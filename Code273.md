# Integer to English Words

```java
//beats 65.71%
class Solution {
    public String numberToWords(int num) {
        if(num==0) return "Zero";
        
        StringBuilder sb=new StringBuilder();
        int numBillions=num/1000000000;
        if(numBillions!=0){
            sb.append(lessThousand(numBillions)).append(" Billion");
            num=num%1000000000;
        }
        
        int numMillions=num/1000000;
        if(numMillions!=0){
            if(sb.length()!=0) sb.append(" ");
            sb.append(lessThousand(numMillions)).append(" Million");
            num=num%1000000;
        }
        
        int numThousand=num/1000;
        if(numThousand!=0){
            if(sb.length()!=0) sb.append(" ");
            sb.append(lessThousand(numThousand)).append(" Thousand");
            num=num%1000;
        }
        
        if(num!=0){
           if(sb.length()!=0) sb.append(" ");
            sb.append(lessThousand(num));
        }
        
        return sb.toString();
    }
    
    private String lessThousand(int num){
        if(num==0) throw new RuntimeException();
        StringBuilder sb=new StringBuilder();
        int numHundreds=num/100;
        if(numHundreds!=0) {
            sb.append(digit(numHundreds));
            sb.append(" Hundred");
        }
        
        num=num%100;
        if(num!=0){
            if(sb.length()!=0) sb.append(" ");
            sb.append(lessHundred(num));
        }
        return sb.toString();
    }
    
    private String digit(int num){
        switch(num){
        case 1: return "One";
        case 2: return "Two";
        case 3: return "Three";
        case 4: return "Four";
        case 5: return "Five";
        case 6: return "Six";
        case 7: return "Seven";
        case 8: return "Eight";
        case 9: return "Nine";
        default: throw new RuntimeException();
        }
    }
    
    private String lessHundred(int num){
        StringBuilder sb=new StringBuilder();
        int numTens=num/10;
        if(numTens>=2){
            sb.append(tens(numTens));
            num=num%10;
            if(num!=0){
                sb.append(" ");
                sb.append(digit(num));
            }
        }
        else if(numTens==1){
            sb.append(teens(num));
        }
        else{
            sb.append(digit(num));
        }
        return sb.toString();
    }
    
    private String tens(int num){
        switch(num){
        case 2: return "Twenty";
        case 3: return "Thirty";
        case 4: return "Forty";
        case 5: return "Fifty";
        case 6: return "Sixty";
        case 7: return "Seventy";
        case 8: return "Eighty";
        case 9: return "Ninety";
        default: throw new RuntimeException();
        }
    }
    
    private String teens(int num){
        switch(num){
        case 10: return "Ten";
        case 11: return "Eleven";
        case 12: return "Twelve";
        case 13: return "Thirteen";
        case 14: return "Fourteen";
        case 15: return "Fifteen";
        case 16: return "Sixteen";
        case 17: return "Seventeen";
        case 18: return "Eighteen";
        case 19: return "Nineteen";
        default: throw new RuntimeException();
        }
    }
}
```