# Permutation Sequence

```java
//beats 36.19%
class Solution {
    public String getPermutation(int n, int k) {
        StringBuilder sb=new StringBuilder();
        
        boolean[] isUsed=new boolean[n];
        
        for(int i=n;i>=2;i--){
            int val1=factorial(i-1);
            int weight=(k-1)/val1;
            k-=val1*weight;
            sb.append(""+findKth(isUsed,weight+1));
        }
        sb.append(""+findKth(isUsed,1));
        return sb.toString();
    }
    
    private int findKth(boolean[] isUsed,int k){
        int cnt=0;
        for(int i=0;i<isUsed.length;i++){
            if(isUsed[i]) continue;
            if(++cnt==k){
                isUsed[i]=true;
                return i+1;
            }
        }
        throw new RuntimeException();
    }
    
    private int factorial(int n){
        int res=1;
        for(int i=1;i<=n;i++){
            res=res*i;
        }
        return res;
    }
}
```