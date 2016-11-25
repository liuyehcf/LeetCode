# Ugly Number II
* 具体思路详见Code313.md

```Java
	//beats 55.72%
	public int nthUglyNumber(int n) {
        int[] primes={2,3,5};
        int[] factors={2,3,5};
        int[] indexs=new int[3];
        int[] ugly=new int[n];
        ugly[0]=1;
        
        for(int i=1;i<n;i++){
            ugly[i]=min(factors);
            for(int j=0;j<3;j++){
                if(factors[j]==ugly[i]){
                    factors[j]=ugly[++indexs[j]]*primes[j];
                }
            }
        }
        return ugly[n-1];
    }
    
    private int min(int[] nums){
        int minimum=Integer.MAX_VALUE;
        for(int num:nums){
            minimum=Math.min(minimum,num);
        }
        return minimum;
    }
```