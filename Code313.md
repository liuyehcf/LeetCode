# Super Ugly Number

* �ȷ�˵������primes=[2,3,5]
* ������ǿ��Դ���һ�����飬������������ź���ĳ����������ÿһ��������ǰ��(����ָ�����ڵ�ǰһ��)�ĳ�������2��3����5�õ���
* ���Ǽ����������Ѿ������ɸ��������ź������������С����ǰ����е�����������M������������������һ���������ó����϶���ǰ��ĳһ����������2��3����5�Ľ�����������ȿ��ǰ����е�ÿ����������2���ڳ���2��ʱ���ܵõ����ɸ����С�ڻ����M�ġ����������ǰ���˳�����ɵģ�С�ڻ��ߵ���M�϶��Ѿ����������ˣ����ǲ����ٴο��ǣ����ǻ���õ����ɸ�����M�Ľ����������ֻ��Ҫ��һ������M�Ľ������Ϊ����ϣ�������ǰ���С����˳�����ɵģ���������Ľ�������Ժ���˵�����ǰѵõ��ĵ�һ������2�����M�Ľ������ΪM2��ͬ�����ǰ����е�ÿһ����������3��5���ܵõ���һ������M�Ľ��M3��M5����ô��һ������Ӧ����M2��M3��M5����������С��


```Java
    //beats 86.50%
    public int nthSuperUglyNumber(int n, int[] primes) {
        int size=primes.length;
        
        int[] ugly=new int[n];
        ugly[0]=1;
        
        int[] factors=new int[size];
        int[] indexs=new int[size];
        
        System.arraycopy(primes,0,factors,0,size);


        for(int i=1;i<n;i++){
            ugly[i]=min(factors);
            for(int j=0;j<size;j++){
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