# Fizz Buzz

* ���ĵ���

```java
class Solution {
//42.52%
    public List<String> fizzBuzz(int n) {
        List<String> res=new ArrayList<String>();
        for(int num=1;num<=n;num++){
            if(num%3==0&&num%5==0)
                res.add("FizzBuzz");
            else if(num%3==0) 
                res.add("Fizz");
            else if(num%5==0)
                res.add("Buzz");
            else 
                res.add(Integer.toString(num));
        }
        return res;
   }
}
```