# Add Strings(用String求大数加法)

```Java
	public String addStrings(String num1, String num2) {
        int carry=0;
        int iter1=num1.length()-1,iter2=num2.length()-1;
        StringBuilder sb=new StringBuilder();
        while(iter1>=0&&iter2>=0){
            int tmp=carry+num1.charAt(iter1--)-'0'+num2.charAt(iter2--)-'0';
            sb.insert(0,tmp%10);
            carry=tmp/10;
        }
        while(iter1>=0){
            int tmp=carry+num1.charAt(iter1--)-'0';
            sb.insert(0,tmp%10);
            carry=tmp/10;
        }
        while(iter2>=0){
            int tmp=carry+num2.charAt(iter2--)-'0';
            sb.insert(0,tmp%10);
            carry=tmp/10;
        }
        if(carry!=0)
            sb.insert(0,carry);
        return sb.toString();
        
    }
```