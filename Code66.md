# Plus One

```Java
//beats 3.69%
public class Solution {
    public int[] plusOne(int[] digits) {
        List<Integer> list=new LinkedList<Integer>();
        
        int carry=1;
        for(int i=digits.length-1;i>=0;i--){
            int sum=digits[i]+carry;
            list.add(0,sum%10);
            carry=sum/10;
        }
        
        if(carry!=0){
            list.add(0,carry);
        }
        
        int[] res=new int[list.size()];
        int iter=0;
        for(int num:list){
            res[iter++]=num;
        }
        
        return res;
    }
}
```