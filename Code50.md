# Pow(x, n)

```Java
//beats 50.44%
public class Solution {
    public double myPow(double x, int n) {
        if(n==0) return 1;
        else if(n==1) return x;
        else if(n==-1) return 1/x;
        else {
            double d=myPow(x,n/2);
            return d*d*myPow(x,n-n/2*2);
        }
    }
}
```


```Java
//beats 19.75%
public class Solution {
    public double myPow(double x, int n) {
        Map<Integer,Double> map=new HashMap<Integer,Double>();
        return pow(x,n,map);
    }
    
    private double pow(double x,int n,Map<Integer,Double> map){
        if(map.containsKey(n)) return map.get(n);
        Double res=null;
        if(n==0){
            res=1D;
        }
        else if(n==1){
            res=x;
        }
        else if(n==-1){
            res=1/x;
        }
        else{
            res=pow(x,n/2,map)*pow(x,n/2,map)*pow(x,n-n/2*2,map);
        }
        map.put(n,res);
        return res;
    }
}
```