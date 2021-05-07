# Sqrt(x)

```java
class Solution {
    public int mySqrt(int x) {
        if(x<4) return x==0?0:1;
        Long res=2L*mySqrt(x/4);
        if((res+1)*(res+1)<=(long)x) return res.intValue()+1;
        return res.intValue();
    }
}
```


```java
class Solution {
    public int mySqrt(int x) {
        Long r=(long)x;
        while(r*r>x){
            r=(r+x/r)/2;
        }
        return r.intValue();
    }
}
```