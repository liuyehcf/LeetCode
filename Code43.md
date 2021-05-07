# beats 6.50%

```java
class Solution {
    public String multiply(String num1, String num2) {
        if(num1.equals("0")||num2.equals("0")) return "0";
        String res="0";
        for(int i=num2.length()-1;i>=0;i--){
            res=add(
                    res,
                    multiplySingle(
                            num1,
                            num2.charAt(i)-'0',
                            (num2.length()-1)-i
                    )
            );
        }
        return res;
    }

    private String multiplySingle(String num,int singleNum,int zeros){
        if(singleNum==0) return "0";
        StringBuilder sb=new StringBuilder();
        int carry=0;
        for(int i=num.length()-1;i>=0;i--){
            int sum=singleNum*(num.charAt(i)-'0')+carry;
            sb.insert(0,Integer.toString(sum%10));
            carry=sum/10;
        }
        if(carry!=0) sb.insert(0,Integer.toString(carry));

        for(int i=0;i<zeros;i++){
            sb.append("0");
        }
        return sb.toString();
    }

    private String add(String num1,String num2){
        StringBuilder sb=new StringBuilder();
        int carry=0;
        int iter1=num1.length()-1;
        int iter2=num2.length()-1;
        while(iter1>=0||iter2>=0||carry!=0){
            if(iter1>=0&&iter2>=0){
                int sum=carry+(num1.charAt(iter1)-'0')+(num2.charAt(iter2)-'0');
                sb.insert(0,Integer.toString(sum%10));
                carry=sum/10;
                iter1--;
                iter2--;
            }
            else if(iter1>=0){
                int sum=carry+(num1.charAt(iter1)-'0');
                sb.insert(0,Integer.toString(sum%10));
                carry=sum/10;
                iter1--;
            }
            else if(iter2>=0){
                int sum=carry+(num2.charAt(iter2)-'0');
                sb.insert(0,Integer.toString(sum%10));
                carry=sum/10;
                iter2--;
            }
            else{
                sb.insert(0,Integer.toString(carry));
                carry=0;
            }
        }
        return sb.toString();
    }
}
```