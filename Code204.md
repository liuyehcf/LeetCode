# Count Primes

```
//beats 34.93
public class Solution {
    public int countPrimes(int n) {
        if(n<2) return 0;
        boolean[] nonPrimes=new boolean[n];
        nonPrimes[0]=true;
        nonPrimes[1]=true;
        for(int i=2;i<n;i++){
            if(!nonPrimes[i]){
                for(int j=2;j*i<n;j++){
                    nonPrimes[j*i]=true;
                }
            }
        }
        int res=0;
        for(boolean b:nonPrimes){
            res+=(b?0:1);
        }
        return res;
    }
}
```