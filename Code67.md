# Add Binary

```java
class Solution {
    public String addBinary(String a, String b) {
        StringBuilder sb=new StringBuilder();
        
        int carry=0;
        int iter1=a.length()-1,iter2=b.length()-1;
        while(iter1>=0&&iter2>=0){
            int sum=a.charAt(iter1)-'0'+b.charAt(iter2)-'0'+carry;
            System.out.println(sum);
            sb.append((sum&1)==0?'0':'1');
            carry=sum>>1;
            iter1--;
            iter2--;
        }
        while(iter1>=0){
            int sum=a.charAt(iter1)-'0'+carry;
            sb.append((sum&1)==0?'0':'1');
            carry=sum>>1;
            iter1--;
        }
        while(iter2>=0){
            int sum=b.charAt(iter2)-'0'+carry;
            sb.append((sum&1)==0?'0':'1');
            carry=sum>>1;
            iter2--;
        }
        if(carry!=0){
            sb.append(carry);
        }
        return sb.reverse().toString();
    }
}
```