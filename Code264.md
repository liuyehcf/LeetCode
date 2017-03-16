# Ugly Number II
* 具体思路详见Code313.md

* 常规思路:按次序选出第i个ugly number，设第i个值为val，那么此时需要将val*2,val*3,val*5放入待选的序列中
* 但是这样会造成大量的重复
* 1 2*ugly(1) 2*ugly(2) 2*ugly(3) 2*ugly(4) 2*ugly(5)...
* 1 3*ugly(1) 3*ugly(2) 3*ugly(3) 3*ugly(4) 3*ugly(5)...
* 1 5*ugly(1) 5*ugly(2) 5*ugly(3) 5*ugly(4) 5*ugly(5)...


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


```Java
//beats 7%
public class Solution {
    public int nthUglyNumber(int n) {
        if(n<=0) throw new RuntimeException();
        Queue<Long> queue=new PriorityQueue<Long>();
        Set<Long> set=new HashSet<Long>();
        queue.offer(1L);
        int cnt=0;
        while(++cnt<n){
            long peek= queue.poll();
            if(set.add(peek*2)) queue.offer(peek*2);
            if(set.add(peek*3)) queue.offer(peek*3);
            if(set.add(peek*5)) queue.offer(peek*5);
        }
        return Integer.parseInt(((Long)queue.peek()).toString());
    }
}
```